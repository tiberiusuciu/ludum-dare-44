draw_self();

var range = 32 * 4;

var max_corpses = 4;
var corpse_count = 0;

with (obj_dead_enemy) {
	if (abs(x - other.x) <= range && abs(y - other.y) <= range) {
		
		in_range = true;
		
		if (obj_game.active_power == "transfusion") {
			if (!other.is_transfusion_on_cd) {
				draw_line_width_color(x, y - 16, other.x, other.y - 16, 1, c_maroon, c_red);
			}
		}
		else if (obj_game.active_power == "explode") {
			if (!other.is_explode_on_cd) {
				if (corpse_count < max_corpses) {
					corpse_count++
					draw_line_width_color(x, y - 16, other.x, other.y - 16, 1, c_yellow, c_orange);
				}
				else {
					draw_line_width_color(x, y - 16, other.x, other.y - 16, 1, c_gray, c_gray);
				}
			}
		}
	}
	else {
		in_range = false;
	}
}

if (obj_game.active_power == "teleport") {
	draw_set_alpha(.25);
	draw_line_width_color(x, y - 16, mouse_x, mouse_y, 1, c_red, c_red);
	draw_set_alpha(1);
}