/// @description client_connect(ip, port, name)
/// @arg ip
/// @arg port
/// @arg name
var ip = argument0,
	port = argument1,
	name = argument2;
	
socket = network_create_socket(network_socket_tcp);

var connect = network_connect(socket, ip, port);

send_buffer = buffer_create(256, buffer_fixed, true);
clientmap = ds_map_create();

if (connect < 0) show_error("Could not connect to server!", true);

buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
buffer_write(send_buffer, buffer_string, name);
network_send_raw(socket, send_buffer, buffer_tell(send_buffer));