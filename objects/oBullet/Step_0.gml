if ( !point_in_rectangle( x, y, 0, 0, room_width, room_height ) )
{
    ds_pool_instance_deactivate( id );
}