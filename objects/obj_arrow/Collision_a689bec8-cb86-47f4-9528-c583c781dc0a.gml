if (arrow_count < 2) {
	if (other.arrow_hit != id) {
		other.arrow_hit = id;
		arrow_count++;
		other.life -= 4;
		audio_sound_pitch(snd_enemy_hurt, random_range(.9, 1.1));
		audio_play_sound(snd_enemy_hurt, 5, false);
		spd--;
	}
}
else {
	instance_destroy(self);
}