if (paused) {
    if (keyboard_check_pressed(vk_anykey)) {
        game_restart();
    }
    return; // Exit the event to prevent further code execution
}

if (game_state == GameState.Playing) {
    // Update direction based on user input
    if (keyboard_check_pressed(vk_right) && direction != 180) direction = 0;
    if (keyboard_check_pressed(vk_up) && direction != 270) direction = 90;
    if (keyboard_check_pressed(vk_left) && direction != 0) direction = 180;
    if (keyboard_check_pressed(vk_down) && direction != 90) direction = 270;

    // Only move the snake if a direction is set
    if (direction != -1) {
        // Move snake head
        x += lengthdir_x(speed, direction);
        y += lengthdir_y(speed, direction);

        // Set the image angle based on the direction
        if (direction == 0) {
            image_angle = 0; // Right
        } else if (direction == 90) {
            image_angle = 270; // Up
        } else if (direction == 180) {
            image_angle = 180; // Left
        } else if (direction == 270) {
            image_angle = 90; // Down
        }

        // Move snake segments
        for (var i = array_length(segments) - 1; i > 0; i--) {
            segments[i].x = segments[i - 1].x;
            segments[i].y = segments[i - 1].y;
            segments[i].image_angle = segments[i - 1].image_angle;
        }

        // Move the first segment to follow the head
        if (array_length(segments) > 0) {
            segments[0].x = x;
            segments[0].y = y;
        }

        // Check for collision with walls
        if (x < 0 || x >= room_width || y < 0 || y >= room_height) {
            // Set game state to GameOver and pause the game
            game_state = GameState.GameOver;
            paused = true;
			speed = 0;
            show_message("Game Over! Press any key to restart.");
        }

        // Check for collision with itself
        for (var i = 1; i < array_length(segments); i++) {
            if (x == segments[i].x && y == segments[i].y) {
                // Set game state to GameOver and pause the game
                game_state = GameState.GameOver;
                paused = true;
				speed = 0;
                show_message("Game Over! Press any key to restart.");
            }
        }
    }
} else if (game_state == GameState.GameOver) {
    // Wait for any key press to restart the game
    if (keyboard_check_pressed(vk_anykey)) {
        game_restart();
		speed = 4;  // Rese the speed to 4 when restarting the game.
    }
}
