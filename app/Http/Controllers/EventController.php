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
        $userId = auth()->id();
        $search = $request->get('search');
        $categoryId = $request->get('category_id'); // Filter by category
        $startDate = $request->get('start_date');   // Filter by date range
        $endDate = $request->get('end_date');
        $perPage = $request->get('per_page', 10);   // Allow dynamic pagination

        $query = Event::withoutTrashed()
            ->with(['user', 'category'])
            ->where('user_id', $userId)
            ->orderBy('created_at', 'desc');

        // Apply search
        if (!empty($search)) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%");
            });
        }

        // Apply category filter
        if (!empty($categoryId)) {
            $query->where('category_id', $categoryId);
        }

        // Apply date range filter
        if (!empty($startDate) && !empty($endDate)) {
            $query->whereBetween('created_at', [
                Carbon::parse($startDate)->startOfDay(),
                Carbon::parse($endDate)->endOfDay()
            ]);
        }

        $events = $query->paginate($perPage);

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
    public function update(Request $request, $id)
    {   
        
        $event = Event::find($id);
        if (!$event) {
            return response()->json(['error' => 'Event not found'], 404);
        }
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
            $imagePath = $request->file('image_path')->store('events', 'public');
            // Store new image
            // $event->image_path = $request->file('image_path')->store('events', 'public');
            $event->image_path = $imagePath;
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

        // Fill other fields except image_path and event_date
        //$event->fill($request->except(['user_id', 'image_path', 'event_date']));
        $event->name = $request->name;
        $event->user_id = $request->user_id;
        $event->category_id = $request->category_id;
        $event->save(); // Save changes

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
