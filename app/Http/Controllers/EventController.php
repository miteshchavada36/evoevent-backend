<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\Event;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Log;

class EventController extends Controller
{
    // List with pagination
    public function index(Request $request)
    {
        $events = Event::withoutTrashed()->with(['user', 'category'])
            ->orderBy('created_at', 'desc')
            ->paginate($request->get('per_page', 10));

        return response()->json($events);
    }

    // Store new event with image upload
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id'     => 'required|exists:users,id',
            'category_id' => 'required|exists:categories,id',
            'name'        => 'required|string|max:255',
            'event_date'  => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $imagePath = null;
        if ($request->hasFile('image_path')) {
            $imagePath = $request->file('image_path')->store('events', 'public'); // stores in storage/app/public/events
        }
        $eventDate = null;
        if (!empty($request->event_date)) {
            try {
                // Extract date part before "GMT"
                $cleanDate = trim(explode("GMT", $request->event_date)[0]);

                // Now parse it
                $eventDate = Carbon::parse($cleanDate)->format('Y-m-d');
            } catch (\Exception $e) {
                return response()->json(['error' => 'Invalid date format'], 422);
            }
        }
        $event = Event::create([
            'user_id'     => $request->user_id,
            'category_id' => $request->category_id,
            'name'        => $request->name,
            'image_path'  => $imagePath,
            'event_date'  => $eventDate,
        ]);

        return response()->json($event, 201);
    }

    

    // Update event (with optional image upload)
    public function update(Request $request, Event $event)
    {   
        $validator = Validator::make($request->all(), [
            'user_id'     => 'sometimes|required|exists:users,id',
            'category_id' => 'sometimes|required|exists:categories,id',
            'name'        => 'sometimes|required|string|max:255',
            'event_date'  => 'sometimes|required',
            'image_path'  => 'sometimes|file|mimes:jpg,jpeg,png,gif|max:2048',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
    
        // Upload new image if provided
        if ($request->hasFile('image_path')) {
            // Delete old image
            if ($event->image_path && Storage::disk('public')->exists($event->image_path)) {
                Storage::disk('public')->delete($event->image_path);
            }
    
            // Store new image
            $event->image_path = $request->file('image_path')->store('events', 'public');
        }
    
        // Format event date if provided
        if (!empty($request->event_date)) {
            try {
                $cleanDate = trim(explode("GMT", $request->event_date)[0]);
                $event->event_date = Carbon::parse($cleanDate)->format('Y-m-d');
            } catch (\Exception $e) {
                return response()->json(['error' => 'Invalid date format'], 422);
            }
        }
    
        // Fill and save all other updatable fields
        $event->fill($request->except(['image_path', 'event_date']));
        $event->save();
    
        return response()->json($event);
    }

    // Show single event
    public function show($id)
    {
        $event = Event::with(['user', 'category'])->find($id);

        if (!$event) {
            return response()->json(['message' => 'Event not found'], 404);
        }

        return response()->json($event);
    }

    // Delete event
    public function destroy($id)
    {
        $event = Event::find($id);
        if (!$event) {
            return response()->json(['message' => 'Event not found'], 404);
        }

        // Delete image
        if ($event->image_path && Storage::disk('public')->exists($event->image_path)) {
            Storage::disk('public')->delete($event->image_path);
        }

        $event->delete();

        return response()->json(['message' => 'Event deleted successfully']);
    }
}
