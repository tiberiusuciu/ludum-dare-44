/// @description Insert description here
// You can write your code in this editor

if (life <= 0) {
	instance_destroy(self);
}

if (!is_attacking) {
	if (instance_exists(obj_player) && !freeze) {
		var target_direction = point_direction(x, y, obj_player.x, obj_player.y);

		length_x = lengthdir_x(spd, target_direction);
		length_y = lengthdir_y(spd, target_direction);

		
		if (obj_game.player_health <= 0) {
			length_x = length_x * -1;
			length_y = length_y * -1;
		}
		x += length_x;
		y += length_y;
	}
	
	if (obj_game.player_health > 0) {
		// attack
		if (instance_exists(obj_player)) {
			var range = 32 * .60;
			if (abs(x - obj_player.x) <= range && abs(y - obj_player.y) <= range) {
				is_attacking = true;
				audio_sound_pitch(snd_enemy_attack, random_range(.9, 1.1));
				audio_play_sound(snd_enemy_attack, 5, false);
				var hitbox = instance_create_layer(x, y - 16, "Instances", obj_enemy_strike);
				hitbox.depth = depth - 5;
				hitbox.target = id;
			
				hitbox.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
			}
		}
	}
}

if (obj_game.player_health > 0) {
	if (obj_player.x < x) {
		image_xscale = -1;
	}
	else {
		image_xscale = 1;
	}
}
depth = -y;