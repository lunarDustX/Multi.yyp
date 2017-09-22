/// @description 
switch (async_load[? "type"]) {
	case network_type_connect:
		server_handle_connect(async_load[? "socket"]);	
	break;
	
	case network_type_data:
		server_handle_message(async_load[? "id"], async_load[? "buffer"]);
	break;
	
	case network_type_disconnect:
		server_handle_disconnect(async_load[? "socket"]);
	break;
}
