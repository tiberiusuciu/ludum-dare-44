/// @description Insert description here
// You can write your code in this editor
if (image_index >= 2 && image_index <= 3) {
	var found = false;
	
	for (var i = 0; i < array_count; i++) {
		if (array_enemies[i] == other.id) {
			var found = true;
		}
	}
	
	if (!found) {
		array_enemies[array_count] = other.id;
		array_count++;
		audio_sound_pitch(snd_enemy_hurt, random_range(.9, 1.1));
		audio_play_sound(snd_enemy_hurt, 5, false);
		other.life -= 5;
	}
	
	
}