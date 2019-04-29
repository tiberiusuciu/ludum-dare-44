/// @description Insert description here
// You can write your code in this editor

if (!freeze) {
	length_x = 0;
	length_y = 0;

	freeze = true;
	image_speed = 0;
	image_index = 0;

	other.freeze = false;
	other.image_speed = .75;

	alarm[0] = room_speed * .15;
}