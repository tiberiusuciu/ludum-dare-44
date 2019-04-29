obj_player.sprite_index = spr_player_death;
obj_player.image_index = 0;
obj_player.image_speed = .5;

obj_camera.shake_duration = 2;
obj_camera.shake_intensity = 2.5;
obj_camera.shake = true;
obj_camera.shake_in_progress = false;

audio_sound_pitch(snd_player_death, random_range(.9, 1.1));
audio_play_sound(snd_player_death, 5, false);