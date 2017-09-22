///@description server_handle_message(id, buffer)
///@arg id
///@arg buffer
var socket_id = argument0,
	buffer = argument1,
	clientObject = clientmap[?string(socket_id)],
	client_id_current = clientObject.client_id;
	
while (true) {
	var message_id = buffer_read(buffer, buffer_u8);
	switch (message_id) {
		case MESSAGE_MOVE:
			var xx = buffer_read(buffer, buffer_u16),
				yy = buffer_read(buffer, buffer_u16);
		
			buffer_seek(send_buffer, buffer_seek_start, 0);
			buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
			buffer_write(send_buffer, buffer_u16, client_id_current);
			buffer_write(send_buffer, buffer_u16, xx);
			buffer_write(send_buffer, buffer_u16, yy);
			
			with (o_serverClient) {
				if (client_id != client_id_current) {
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
		break;
		
		case MESSAGE_JOIN:
			var username = buffer_read(buffer, buffer_string);
			clientObject.name = username;
			
			buffer_seek(send_buffer, buffer_seek_start, 0);
			buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
			buffer_write(send_buffer, buffer_u16, client_id_current);
			buffer_write(send_buffer, buffer_string, username);
			
			// sending the newly joining name to all other clients
			with (o_serverClient) {
				if (client_id != client_id_current) {
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
			
			// send the newly joined client the names of all other clients
			with (o_serverClient) {
				if (client_id != client_id_current) {
					buffer_seek(other.send_buffer, buffer_seek_start, 0);
					buffer_write(other.send_buffer, buffer_u8, MESSAGE_JOIN);
					buffer_write(other.send_buffer, buffer_u16, client_id);
					buffer_write(other.send_buffer, buffer_string, name);
					network_send_raw(socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
		break;
	}
	
	if (buffer_tell(buffer) == buffer_get_size(buffer)) break;
}