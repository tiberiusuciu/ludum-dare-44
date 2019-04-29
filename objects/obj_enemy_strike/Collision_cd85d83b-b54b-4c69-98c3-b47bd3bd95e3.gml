if (ready_to_hit && !has_hit) {
	audio_sound_pitch(snd_hurt, random_range(.9, 1.1));
	audio_play_sound(snd_hurt, 5, false);
	
	
	
	obj_game.player_health -= 2;
	obj_camera.shake = true;
	has_hit = true;
	
	if (other.x < x - 16) {
		other.hspd = -20
	}
	else if (other.x > x + 16) {
		other.hspd = 20;
	}
	
	if (other.y > y + 16) {
		other.vspd = 20;
	}
	else if (other.y < y - 16) {
		other.vspd = -20;
	}
}