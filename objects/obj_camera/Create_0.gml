target = obj_player;
pan = false;

shake = false;
shake_in_progress = false;

shake_duration = .2;
shake_intensity = 2;


width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

if (instance_exists(target)) {
	x = target.x;
	y = target.y;
}