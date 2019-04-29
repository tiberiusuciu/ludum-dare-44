/// @description Insert description here
// You can write your code in this editor


if (image_index >= 2 && !ready_to_hit) {
	ready_to_hit = true;
}
else if (image_index > 3 && ready_to_hit) {
	ready_to_hit = false
}
else {
	ready_to_hit = false;
}