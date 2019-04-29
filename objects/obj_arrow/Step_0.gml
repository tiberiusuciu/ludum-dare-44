/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (!collided) {
	var length_x = lengthdir_x(spd, target_direction);
	var length_y = lengthdir_y(spd, target_direction);


	// Horizontal collisions
	if (place_meeting(x + length_x, y, obj_solid)) {
		collided = true;
		while (!place_meeting(x + sign(length_x), y, obj_solid)) {
			x += sign(length_x);
		}
		length_x = 0;
	}

	// Vertical collisions
	if (place_meeting(x, y + length_y, obj_solid)) {
		collided = true;
		while (!place_meeting(x, y + sign(length_y), obj_solid)) {
			y += sign(length_y);
		}
		length_y = 0;
	}


	x += length_x;
	y += length_y;
}
else if (!is_set_to_self_destroy){
	is_set_to_self_destroy = true;
	alarm[0] = room_speed * 3;
}