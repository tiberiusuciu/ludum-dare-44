if (instance_exists(target)) {
		x = lerp(x, target.x, .1);
		y = lerp(y, target.y - 16, .1);
	
		x = clamp(x, width / 2, room_width - width / 2);
		y = clamp(y, height / 2, room_height - height / 2);
	
	if (pan) {
		x = lerp(x, mouse_x, .04);
		y = lerp(y, mouse_y, .04);
	
		x = clamp(x, width / 2, room_width - width / 2);
		y = clamp(y, height / 2, room_height - height / 2)
	}
	
	if (shake && !shake_in_progress) {
		shake_in_progress = true;
		alarm[0] = room_speed * shake_duration;
	}
	if (shake_in_progress) {
		x += random_range(-shake_intensity, shake_intensity);
	}
	
	// Shake events could be done here?
	
	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}