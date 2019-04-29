if (player_health > 0) {
	player_health += 2;
	
	if (player_health > 20) {
		player_health = 20;
	}
	
	alarm[2] = room_speed * 5;
}