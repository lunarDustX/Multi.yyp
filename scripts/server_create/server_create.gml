///@description server_create(port)
///@arg port
var port = argument0,
	server = 0;

server = network_create_server(network_socket_tcp, port, 20);

clientmap = ds_map_create();
client_id_counter = 0;
send_buffer = buffer_create(256, buffer_fixed, 1);

if (server < 0) show_error("Could not create server!", true);

return server;