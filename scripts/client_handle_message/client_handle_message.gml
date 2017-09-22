///@description client_handle_message(buffer)
///@arg buffer
var buffer = argument0;

while (true) {
	var message_id = buffer_read(buffer, buffer_u8);
	switch (message_id) {
		case MESSAGE_MOVE:
			var
			client = buffer_read(buffer, buffer_u16),
			xx = buffer_read(buffer, buffer_u16),
			yy = buffer_read(buffer, buffer_u16),
			clientObject = client_get_object(client);
				
			clientObject.tim = 0;
			clientObject.prx = clientObject.x;
			clientObject.pry = clientObject.y;
			clientObject.tox = xx;
			clientObject.toy = yy;
		break;
		
		case MESSAGE_JOIN:
			var 
			client = buffer_read(buffer, buffer_u16),
			username = buffer_read(buffer, buffer_string),
			clientObject = client_get_object(client);
			clientObject.name = username;
		break;
		
		case MESSAGE_LEAVE:
			var 
			client = buffer_read(buffer, buffer_u16);
			tempObject = client_get_object(client);
			with (tempObject) instance_destroy();
		break;
	}
	
	if (buffer_tell(buffer) == buffer_get_size(buffer)) break;
}