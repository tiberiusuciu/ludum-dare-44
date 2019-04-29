/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_proggy);


if (room == room2) {	
	draw_set_alpha(.25);
	draw_rectangle_color(0, 0, room_width, room_height, c_navy, c_navy, c_navy, c_navy, false);
	draw_set_alpha(1);
	
	draw_text_transformed_color(room_width/2 - 110, 100, "Game Over", 4, 4, 0, c_red, c_red, c_red, c_red, 1);
	draw_text_transformed_color(room_width/2 - 105, 150, "Total Kill Count:", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width/2 - 10, 200, string(total_kills), 2, 2, 0, c_red, c_red, c_red, c_red, 1);

	draw_text_transformed_color(room_width/2 - 275, 280, "Thank you for playing my Ludum Dare 44 entry", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width/2 - 137, 330, "Made by @SuciuTiberius", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

	draw_text_transformed_color(room_width/2 - 320, 380, "Special thanks to friends and family for the support", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width/2 - 340, 430, "Honoroable mentions goes to my supportive girlfriend :D", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

	draw_text_transformed_color(room_width/2 - 300, 580, "Press <escape> to quit or press <r> to start again", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width/2 - 220, 630, "Press <enter> to go back to main menu", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

	if (fade_amount > 0) {
		draw_set_alpha(fade_amount);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	
		fade_amount -= .0075;
	}
}
else if (room == room1) {
	if (player_health > 0) {
		draw_set_color(c_black);
		draw_rectangle(32, 38, 986, 64, false);

		draw_set_color(c_red);
		draw_rectangle(38, 44, 38 + 942 * clamp(player_health / player_max_health, 0, 1), 58, false);

		draw_set_color(c_white);
		
		var str1 = string(active_power);
		var str2 = string_char_at(str1, 1); // return the first character of the string
		str2 = string_upper( str2 );    // make the character uppercase

		str1 = string_delete(str1, 1, 1);   // delete the first (lowercase) character
		str1 = string_insert(str2, str1, 1) // insert the uppercase character into the original string
	
		draw_text_transformed_color(800, 86, "Kills: " + string(total_kills), 3, 3, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(400, 10, "Health: " + string(player_health), 3, 3, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(35, 86, "Power: " + str1, 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	
	
		var spacing = 128;

		draw_sprite_ext(spr_ui_sword, active_power == "sword", 32 + spacing, 632, 4, 4, 0, c_white, .95);
		draw_sprite_ext(spr_ui_arrow, active_power == "arrow", 170 + spacing, 632, 4, 4, 0, c_white, .95);
		draw_sprite_ext(spr_ui_transfusion, active_power == "transfusion", 308 + spacing, 632, 4, 4, 0, c_white, .95);
		draw_sprite_ext(spr_ui_explode, active_power == "explode", 446 + spacing, 632, 4, 4, 0, c_white, .95);
		draw_sprite_ext(spr_ui_teleport, active_power == "teleport", 584 + spacing, 632, 4, 4, 0, c_white, .95);
		// draw_sprite_ext(spr_ui_wall, active_power == "wall", 722 + spacing, 632, 4, 4, 0, c_white, .95);
	
		if (obj_player.is_transfusion_on_cd) {
			draw_set_color(c_black);
			draw_set_alpha(.85);
			draw_rectangle(308 + spacing, 632, 308 + spacing + 128, 760, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			
			draw_sprite_ext(spr_hourglass, 0, 308 + spacing + 42, 660, 4, 4, 0, c_white, 1);
		}
		
		if (obj_player.is_explode_on_cd) {
			draw_set_color(c_black);
			draw_set_alpha(.85);
			draw_rectangle(446 + spacing, 632, 446 + spacing + 128, 760, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			
			draw_sprite_ext(spr_hourglass, 0, 446 + spacing + 42, 660, 4, 4, 0, c_white, 1);
		}
	
	
		var tile_location = 175;
		var positioning = 160;
		var vertical_pos = 540;
	
	
		if (active_power == "sword") {
			// sword props	
			draw_sprite_ext(spr_blood_drop, 0, tile_location + 5 + 15, vertical_pos, 1.25, 1.25, 0, c_white, 1);
			draw_text_transformed(tile_location + 45, vertical_pos + 8, "-2", 2.5, 2.5, 0);
			draw_sprite_ext(spr_power, 0, tile_location + 15, vertical_pos + 50, 2, 2, 0, c_white, 1);
			draw_text_transformed(tile_location + 60, vertical_pos + 50, "5", 2.5, 2.5, 0);
		}
	
	
		if (active_power == "arrow") {
			// arrow props
			tile_location = 310;
			draw_sprite_ext(spr_blood_drop, 0, tile_location + 5 + 15, vertical_pos, 1.25, 1.25, 0, c_white, 1);
			draw_text_transformed(tile_location + 45, vertical_pos + 8, "-2", 2.5, 2.5, 0);
			draw_sprite_ext(spr_power, 0, tile_location + 15, vertical_pos + 50, 2, 2, 0, c_white, 1);
			draw_text_transformed(tile_location + 60, vertical_pos + 50, "4", 2.5, 2.5, 0);
		}
	
		if (active_power == "transfusion" && !obj_player.is_transfusion_on_cd) {
			// transfusion props
			tile_location = 395;
			draw_sprite_ext(spr_blood_drop, 0, tile_location + 5 + 15, vertical_pos, 1.25, 1.25, 0, c_white, 1);
			draw_text_transformed(tile_location + 60, vertical_pos + 8, "+ (x * 6)", 2.5, 2.5, 0);
		}
	
	
		if (active_power == "explode" && !obj_player.is_explode_on_cd) {
			// explode props
			tile_location = 580;
			draw_sprite_ext(spr_blood_drop, 0, tile_location + 5 + 15, vertical_pos, 1.25, 1.25, 0, c_white, 1);
			draw_text_transformed(tile_location + 45, vertical_pos + 8, "-2", 2.5, 2.5, 0);
			draw_sprite_ext(spr_power, 0, tile_location + 15, vertical_pos + 50, 2, 2, 0, c_white, 1);
			draw_text_transformed(tile_location + 60, vertical_pos + 50, "(x * 8)", 2.5, 2.5, 0);
		}
	
		if (active_power == "teleport") {
			// teleport props
			tile_location = 715;
			draw_sprite_ext(spr_blood_drop, 0, tile_location + 5 + 15, vertical_pos, 1.25, 1.25, 0, c_white, 1);
			draw_text_transformed(tile_location + 45, vertical_pos + 8, "-1", 2.5, 2.5, 0);
		}
	}
	else if (!play_death_animation) {
		with (obj_enemy) {
			image_xscale = image_xscale * -1;
		}
		play_death_animation = true;
		active_power = "sword"
		obj_player.image_index = 0;
		obj_player.image_speed = 0;
		alarm[1] = room_speed * 1.5;
	}
}
else if (room == room0) {
	draw_set_alpha(.25);
	draw_rectangle_color(0, 0, room_width, room_height, c_navy, c_navy, c_navy, c_navy, false);
	draw_set_alpha(1);
	
	draw_set_color(make_color_rgb(227, 94, 51));
	draw_text_transformed(50, 50, "Ludum", 5, 5, 0);
	draw_set_color(make_color_rgb(227, 139, 48));
	draw_text_transformed(215, 50, "Dare", 5, 5, 0);
	draw_set_color(make_color_rgb(250, 222, 55));
	draw_text_transformed(350, 50, "44", 5, 5, 0);
	
	draw_set_color(c_white);

	draw_text_transformed(50, 125, "Tiberiusuciu Presents:", 2, 2, 0);

	draw_set_color(c_red);
	draw_text_transformed(50, 160, "Blood", 4, 4, 0);
	draw_set_color(c_maroon);
	draw_text_transformed(175, 160, "Bath", 4, 4, 0);
	
	draw_set_color(c_white);
	
	var text01 = "The theme is:";
	var text02 = "Your Life Is Currency";
	var text03 = "You are the last Blood Mage,\nSurvive as long as you can and go out with a BANG!";
	var text04 = "Press <space> to start";
	
	var vspace = 150;
	draw_text_transformed(50, 200 + vspace, text01, 2, 2, 0);
	draw_text_transformed(50, 250 + vspace, text02, 2, 2, 0);
	draw_text_transformed(50, 300 + vspace, text03, 2, 2, 0);	
	
	var text05 = "Move with WASD or arrow keys";
	var text06 = "Cycle through spells with right click";
	var text07 = "Use spell with left click";
	
	draw_text_transformed(50, 400 + vspace, text05, 2, 2, 0);
	draw_text_transformed(50, 440 + vspace, text06, 2, 2, 0);
	draw_text_transformed(50, 480 + vspace, text07, 2, 2, 0);
	draw_text_transformed(50, 520 + vspace + 10, text04, 2, 2, 0);
	draw_text_transformed(50, 720, "Press <m> to mute sound", 2, 2, 0);
	
	draw_sprite_ext(spr_keyboard, 0, 400, 535, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_keyboard, 1, 470, 535, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_mouse, 1, 510, 585, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_mouse, 0, 365, 620, 2, 2, 0, c_white, 1);
	
	
	draw_sprite_ext(spr_ui_sword, 0, 665, 150, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_ui_arrow, 0, 665, 270, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_ui_transfusion, 0, 665, 390, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_ui_explode, 0, 665, 510, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_ui_teleport, 0, 665, 630, 3, 3, 0, c_white, 1);
	
	draw_set_color(c_red);
	draw_text_transformed(780, 160, "Sword", 3, 3, 0);
	draw_text_transformed(780, 280, "Arrow", 3, 3, 0);
	draw_text_transformed(780, 400, "Transfusion", 3, 3, 0);
	draw_text_transformed(780, 520, "Explode", 3, 3, 0);
	draw_text_transformed(780, 640, "Teleport", 3, 3, 0);
	draw_set_color(c_white);
	
	draw_set_color(c_yellow);
	draw_text_transformed(710, 80, "All enemies will leave\na corpse when dead", 2, 2, 0);
	draw_set_color(c_white);
	
	draw_text_transformed(780, 200, "Summons a sword made of blood.\nAll enemies in its swing\ngets hit. Aim with mouse", 1.25, 1.25, 0);
	draw_text_transformed(780, 320, "Summons an arrow made of blood.\nIt hits up to 1 enemy at a time.\nAim with mouse", 1.25, 1.25, 0);
	draw_text_transformed(780, 440, "Cast Transfusion to nearby\ncorpses to absorb their blood\nand heal yourself partially", 1.25, 1.25, 0);
	draw_text_transformed(780, 550, "Cast Explode to neaby corpses\nto make them explode dealing\ndamage to nearby enemies.\nYou may only explode 4\ncorpses at a time!", 1.25, 1.25, 0);
	draw_text_transformed(780, 680, "Teleport yourself to your\nmouse location", 1.25, 1.25, 0);
	

	
	if (fade_amount > 0) {
		draw_set_alpha(fade_amount);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	
		fade_amount -= .0075;
	}
}