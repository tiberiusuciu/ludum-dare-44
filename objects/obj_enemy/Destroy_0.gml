var dead = instance_create_layer(x, y, "Instances", obj_dead_enemy);

audio_sound_pitch(snd_enemy_death, random_range(.9, 1.1));
audio_play_sound(snd_enemy_death, 5, false);

obj_game.total_kills++;

dead.sprite_index = death_sprite;
dead.image_xscale = image_xscale;