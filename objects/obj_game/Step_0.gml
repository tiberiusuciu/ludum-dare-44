// might change to id instead

if (room == room1) {
	if (player_health > 0) {
		with (obj_spawner) {
			var randomResult = random(10);
			if (randomResult <= other.enemy_spawn_rate) {
				var enemy = instance_create_layer(x, y, "Instances", obj_enemy);
		
				if (is_horizontal) {
					enemy.x = random_range(bbox_left, bbox_right);
				}
				else {
					enemy.y = random_range(bbox_bottom, bbox_top);
				}
			}
		}
		if (total_kills > 15) {
			enemy_spawn_rate = 0.01 * (total_kills / 15);
		}
		if (alarm[2] == -1) {
			alarm[2] = room_speed * 5;
		}
	}
}
else if (room == room2) {
	var enter = keyboard_check_pressed(vk_enter);
	var escape = keyboard_check_pressed(vk_escape);
	var r = keyboard_check_pressed(ord("R"));
	
	if (enter) {
		player_health = 20;
		player_max_health = 20;
		enemy_spawn_rate = .01;
		active_power = "sword";
		play_death_animation = false;
		transition_to_credits_ready = false;
		make_fade = false;
		fade_amount = 1;

		total_kills = 0;
		room_goto(room0);
	}
	if (escape) {
		game_end();
	}
	if (r) {
		player_health = 20;
		player_max_health = 20;
		enemy_spawn_rate = .01;
		active_power = "sword";
		play_death_animation = false;
		transition_to_credits_ready = false;
		make_fade = false;

		total_kills = 0;
		room_goto(room1);
	}
}
else if (room == room0) {
	var space = keyboard_check_pressed(vk_space);
	
	if (space) {
		room_goto(room1);
	}
}