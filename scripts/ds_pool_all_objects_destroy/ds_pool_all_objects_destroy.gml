/// @param execute_event_flag
///
/// Returns if the destruction of all pooled instances (of any object type) resulted in no errors

var _success = true;

var _object_index = ds_map_find_first( global.__ds_pool_object_lookup );
repeat( ds_map_size( global.__ds_pool_object_lookup ) )
{
    if ( !ds_pool_object_destroy( _object_index, argument0 ) ) _success = false;
    _object_index = ds_map_find_next( global.__ds_pool_object_lookup, _object_index );
}

return _success;