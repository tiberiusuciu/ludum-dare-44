/// @description Insert description here
// You can write your code in this editor

type = irandom_range(0, 4);

switch (type) {
	case 0: 
		sprite_index = spr_enemy;
		max_life = 10;
		death_sprite = spr_dead_enemy;
		break;
	case 1:
		sprite_index = spr_enemy_blue;
		max_life = 12;
		death_sprite = spr_dead_enemy_blue;
		break;
	case 2:
		sprite_index = spr_enemy_red;
		max_life = 18;
		death_sprite = spr_dead_enemy_red;
		break;
	case 3:
		sprite_index = spr_enemy_black;
		max_life = 25;
		death_sprite = spr_dead_enemy_black;
		break;
	case 4:
		sprite_index = spr_enemy_white;
		max_life = 35;
		death_sprite = spr_dead_enemy_white;
		break;
}

life = max_life;

arrow_hit = false;

spd = 1;

length_x = 0;
length_y = 0;

freeze = false;

is_attacking = false;

image_speed = .75;