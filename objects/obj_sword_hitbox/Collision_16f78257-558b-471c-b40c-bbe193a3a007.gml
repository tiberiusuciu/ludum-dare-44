/// @description Insert description here
// You can write your code in this editor
	

	with (other) {
		audio_sound_pitch(snd_enemy_hurt, random_range(.9, 1.1));
		audio_play_sound(snd_enemy_hurt, 5, false);
		life -= 5;
	}


//instance_destroy(self);