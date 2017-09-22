/// @description 
if (txt == "create server") {
	with(o_button) instance_destroy();
	instance_create_depth(0,0,0, o_server);
} else {
	with(o_button) instance_destroy();
	instance_create_depth(0, 0, 0, o_client);
	instance_create_depth(300, 300, 0 ,o_player);
}