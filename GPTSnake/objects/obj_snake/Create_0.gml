// Include constants script
scr_constants();

// Snake initialization
direction = -1; // Starting direction (-1 = no movement)
speed = 4; // Speed of snake (size of one segment)
segments = []; // Array to store snake segments
game_state = GameState.Playing; // Set initial game state to Playing
paused = false; // Initialize paused state

// Create initial snake head
segments[0] = instance_create_layer(x, y, "Instances", obj_snake_segment);

// Create initial snake body segments
for (var i = 1; i < 3; i++) {
    var segment = instance_create_layer(x - (i * speed), y, "Instances", obj_snake_segment);
    array_push(segments, segment);
}
