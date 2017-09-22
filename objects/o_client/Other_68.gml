/// @description 
switch (async_load[? "type"]) {
	case network_type_data:
		client_handle_message(async_load[? "buffer"]);
	break;
}
