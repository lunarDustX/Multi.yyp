///@description server_handle_connect(socket_id)
///@arg socket_id
var socket_id = argument0;
l = instance_create_depth(0, 0, 0, o_serverClient);
l.socket_id = socket_id;
l.client_id = client_id_counter++;

if (client_id_counter >= 65000) client_id_counter = 0;

clientmap[? string(socket_id)] = l;