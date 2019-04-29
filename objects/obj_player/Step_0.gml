/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (obj_game.player_health > 0) {
	var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	var down = keyboard_check(ord("S")) || keyboard_check(vk_down);

	var leftClick = mouse_check_button_pressed(mb_left);
	var rightClick = mouse_check_button_pressed(mb_right);

	hspd += (right - left) * spd;
	vspd += (down - up) * spd;

	// Animations
	if (hspd != 0 || vspd != 0) {
		image_speed = 1;
		if (sign(hspd) == -1) {
			image_xscale = -1;
		}
		else if (sign(hspd) == 1) {
			image_xscale = 1;
		}
	}
	else {
		image_index = 0;
		image_speed = 0;
	}


	// Horizontal collisions
	// x + hspd < sprite_width / 2 || x + hspd > room_width - sprite_width / 2
	if (place_meeting(x + hspd, y, obj_solid)) {
		while (!place_meeting(x + sign(hspd), y, obj_solid)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	// Vertical collisions
	if (place_meeting(x, y + vspd, obj_solid)) {
		while (!place_meeting(x, y + sign(vspd), obj_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
	}

	if (leftClick) {
		if (obj_game.active_power == "sword") {
			audio_sound_pitch(snd_blood_strike, random_range(.9, 1.1));
			audio_play_sound(snd_blood_strike, 5, false);
			var swordAnimate = instance_create_layer(x, y - 16, "Instances", obj_sword_strike);
			
			swordAnimate.image_angle = point_direction(swordAnimate.x, swordAnimate.y, mouse_x, mouse_y);
			
			
			/*
			if (mouse_x < x && mouse_x < x - sprite_width / 2) {
				swordAnimate.x -= 20;
			}
			if (mouse_x > x && mouse_x > x + sprite_width / 2) {
				swordAnimate.x += 20;
			}
			if (mouse_y < y && mouse_y < y - 32) {
				swordAnimate.y -= 40;
			}
			else if (mouse_y < y && !(mouse_y < y - 32)) {
				swordAnimate.y -= 16;
			}
			else {
				swordAnimate.y += 10;
			}
			*/
			//swordAnimate.image_angle = point_direction(x, y, mouse_x, mouse_y);
			obj_game.player_health -= 2;
		}
		else if (obj_game.active_power == "arrow") {
			audio_sound_pitch(snd_arrow_strike, random_range(.9, 1.1));
			audio_play_sound(snd_arrow_strike, 5, false);
			var projectile = instance_create_layer(x, y - 16, "Instances", obj_arrow);
			obj_game.player_health -= 2;
		}
		else if (obj_game.active_power == "transfusion") {
			var has_used = false;
			with (obj_dead_enemy) {
				if (in_range) {
					
					if (!other.is_transfusion_on_cd) {
						if (obj_game.player_health < 20) {
							instance_destroy(self);
							audio_sound_pitch(snd_transfusion, random_range(.9, 1.1));
							audio_play_sound(snd_transfusion, 5, false);
							audio_sound_pitch(snd_heal, random_range(.9, 1.1));
							audio_play_sound(snd_heal, 5, false);
							obj_game.player_health += 6;
							var has_used = true;
						}
						else {
							obj_game.player_health = 20;
						}
					
						if (obj_game.player_health > 20) {
							obj_game.player_health = 20;
						}
					}
				}
			}
			
			if (has_used) {
				obj_camera.shake_duration = .5;
				obj_camera.shake_intensity = 2;
				obj_camera.shake = true;
				obj_camera.shake_in_progress = false
				is_transfusion_on_cd = true;
				alarm[1] = room_speed * 2;
			}
			else {
				audio_sound_pitch(snd_dud, random_range(.9, 1.1));
				audio_play_sound(snd_dud, 5, false);
			}
		}
		else if (obj_game.active_power == "explode") {
			var has_used = false;
			var max_corpses = 4;
			var corpse_count = 0;
			with (obj_dead_enemy) {
			
				if (!other.is_explode_on_cd) {
					if (in_range && corpse_count < max_corpses) {
						audio_sound_pitch(snd_explode, random_range(.9, 1.1));
						audio_play_sound(snd_explode, 5, false);
						corpse_count++;
						var range = 32 * 4;
						instance_create_layer(x, y, "Instances", obj_detonation);
						with (obj_enemy) {
							if (abs(x - other.x) <= range && abs(y - other.y) <= range) {
								audio_sound_pitch(snd_enemy_hurt, random_range(.9, 1.1));
								audio_play_sound(snd_enemy_hurt, 5, false);
								life -= 8;
							}
						}
						has_used = true;
						instance_destroy(self);
					}
				}
			}
			if (has_used) {
				obj_camera.shake_duration = .5;
				obj_camera.shake_intensity = 2;
				obj_camera.shake = true;
				obj_camera.shake_in_progress = false;
				obj_game.player_health -= 2;
				is_explode_on_cd = true;
				alarm[0] = room_speed * 4;
			}
			else {
				audio_sound_pitch(snd_dud, random_range(.9, 1.1));
				audio_play_sound(snd_dud, 5, false);
			}
		}
		else if (obj_game.active_power == "teleport") {
			audio_sound_pitch(snd_warp, random_range(.9, 1.1));
			audio_play_sound(snd_warp, 5, false);
			x = mouse_x;
			y = mouse_y;
			obj_game.player_health -= 1;
		}
	}
	if (rightClick) {
		
		audio_sound_pitch(snd_spell_select, random_range(.9, 1.1));
		audio_play_sound(snd_spell_select, 5, false);
		if (obj_game.active_power == "sword") {
			obj_game.active_power = "arrow";
		}
		else if (obj_game.active_power == "arrow") {
			obj_game.active_power = "transfusion";
		}
		else if (obj_game.active_power == "transfusion") {
			obj_game.active_power = "explode";
		}
		else if (obj_game.active_power == "explode") {
			obj_game.active_power = "teleport";
		}
		else if (obj_game.active_power == "teleport") {
			obj_game.active_power = "sword";
		}
	
		//else if (obj_game.active_power == "wall") {
		//	obj_game.active_power = "sword";
		//}
	}

	x += hspd;
	y += vspd;
	hspd = 0;
	vspd = 0;
}