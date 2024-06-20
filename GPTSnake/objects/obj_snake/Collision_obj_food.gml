// Collision with food
instance_destroy(other); // Destroy the food object

// Create new food at a random position with random color
var food = instance_create_layer(irandom(room_width div 16) * 16, irandom(room_height div 16) * 16, "Instances", obj_food);

// Add new segment to snake at the position of the last segment
if (array_length(segments) > 0) {
    var last_segment = segments[array_length(segments) - 1];
    var new_segment = instance_create_layer(last_segment.x, last_segment.y, "Instances", obj_snake_segment);
    array_push(segments, new_segment);
}

// Update the built-in score variable
score += 10;
