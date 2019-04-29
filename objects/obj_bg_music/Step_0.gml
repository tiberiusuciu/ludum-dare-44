var m = keyboard_check_pressed(ord("M"));

if (m) {
	
	if (muteMusic) {
		audio_stop_sound(snd_bg);
	}
	else {
		audio_play_sound(snd_bg, 7, true);
	}
	
	muteMusic = !muteMusic;
}