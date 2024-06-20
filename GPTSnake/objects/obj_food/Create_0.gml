// Create Event for obj_food

// Define the margins
var margin = 50;

// Position the food randomly within the screen borders, considering the margins
x = irandom_range(margin, room_width - margin - 32);
y = irandom_range(margin, room_height - margin - 32);

// Set image_index to a random frame between 0 and 15
image_index = irandom(15);
image_speed = 0; // Stop the animation from looping

// Scale the food items to 32x32
image_xscale = 32 / sprite_get_width(sprite_index);
image_yscale = 32 / sprite_get_height(sprite_index);
