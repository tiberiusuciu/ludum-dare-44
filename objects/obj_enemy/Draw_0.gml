/// @description Insert description here
// You can write your code in this editor

draw_self();
if (life < 0) {
	life = 0;
}
draw_text_transformed(x - 16, y - 45, string(life) + "/" + string(max_life), 1.25, 1.25, 0);