/// @description 
if (!connected) {
	connected = true;
	client_connect("127.0.0.1", 9000, async_load[? "result"]);
	alarm[0] = UPDATE_SPEED;
}
