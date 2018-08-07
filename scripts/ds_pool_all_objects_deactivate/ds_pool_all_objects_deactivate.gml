/// @param [execute_cleanup_event] <- defaults to <false>
/// @param [execute_destroy_event] <- defaults to <false>
///
/// Returns if the deactivation of all pooled instances (of any object type) resulted in no errors

var _success = true;

if ( argument_count == 0 )
{
    var _object_index = ds_map_find_first( global.__ds_pool_object_lookup );
    repeat( ds_map_size( global.__ds_pool_object_lookup ) )
    {
        if ( !ds_pool_instance_deactivate( _object_index ) ) _success = false;
        _object_index = ds_map_find_next( global.__ds_pool_object_lookup, _object_index );
    }
    return _success;
}
else if ( argument_count == 1 )
{
    var _object_index = ds_map_find_first( global.__ds_pool_object_lookup );
    repeat( ds_map_size( global.__ds_pool_object_lookup ) )
    {
        if ( !ds_pool_instance_deactivate( _object_index, argument[1] ) ) _success = false;
        _object_index = ds_map_find_next( global.__ds_pool_object_lookup, _object_index );
    }
    return _success;
}
else
{
    var _object_index = ds_map_find_first( global.__ds_pool_object_lookup );
    repeat( ds_map_size( global.__ds_pool_object_lookup ) )
    {
        if ( !ds_pool_instance_deactivate( _object_index, argument[1], argument[2] ) ) _success = false;
        _object_index = ds_map_find_next( global.__ds_pool_object_lookup, _object_index );
    }
    return _success;
}