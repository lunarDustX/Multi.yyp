/// client_get_object(client_id)
var client_id = argument0;

if (ds_map_exists(clientmap, string(client_id))) {
//show_message("old");
	return clientmap[? string(client_id)];
	
} else {
//show_message("new");
	var l = instance_create_depth(0, 0, 0, o_otherClient);
	clientmap[?string(client_id)] = l;
	return l;
}