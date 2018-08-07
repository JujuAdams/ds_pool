/// @param pool
/// @param index
///
/// Returns if the deletion operation was successful

if ( ds_pool_index_is_deleted( argument0, argument1 ) ) return false; //Don't try to delete an index that's already deleted
ds_map_add( argument0[E_DS_POOL.MAP], argument1, current_time );
show_debug_message( object_get_name( object_index ) + ":" + string( id ) + ", index=" + string( argument1 ) + ", has been deactivated" ); 
return true;