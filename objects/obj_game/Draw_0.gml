if (make_fade && !transition_to_credits_ready) {
	draw_set_alpha(fade_amount);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
		
	fade_amount += .0075;
		
	if (fade_amount > 1) {
		transition_to_credits_ready = true;
		make_fade = false;
	}
}
else if (transition_to_credits_ready) {
	transition_to_credits_ready = false;
	fade_amount = 1;
	
	player_health = 20;
	player_max_health = 20;
	enemy_spawn_rate = .01;
	active_power = "sword";
	play_death_animation = false;
	transition_to_credits_ready = false;
	make_fade = false;
	
	room_goto(room2);
}

if (room == room1) {
	
	if (player_health == 3) {
		draw_set_alpha(.15);
		draw_set_color(c_red);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	else if (player_health == 2) {
		draw_set_alpha(.35);
		draw_set_color(c_red);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	else if (player_health == 1 || player_health == 0) {
		draw_set_alpha(.5);
		draw_set_color(c_red);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}