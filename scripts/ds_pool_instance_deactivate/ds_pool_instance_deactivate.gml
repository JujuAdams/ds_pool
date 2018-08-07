/// @param instance/object
/// @param [execute_cleanup_event]
/// @param [execute_destroy_event]
///
/// Returns if instance (or object) deactivation was successful

var _error = false;
var _found = false;

with( argument[0] )
{
    _found = true;
    
    if ( !ds_map_exists( global.__ds_pool_object_lookup, object_index ) )
    {
        show_error( object_get_name( object_index ) + ":" + string( id ) + " was not created by ds_pool_instance_activate_*()!\n ", false );
        _error = true;
        continue;
    }
    else
    {
        var _pool = ds_map_find_value( global.__ds_pool_object_lookup, object_index );
    }
    
    if ( !ds_pool_delete( _pool, __ds_pool_index ) )
    {
        show_debug_message( object_get_name( object_index ) + ":" + string( id ) + " has already been deactivated" );
        continue;
    }
    
    if ( (argument_count > 1) && argument[1] ) event_perform( ev_cleanup, 0 );
    if ( (argument_count > 2) && argument[2] ) event_perform( ev_destroy, 0 );
    
    show_debug_message( object_get_name( object_index ) + ":" + string( id ) + " deactivated" );
    instance_deactivate_object( id );
}

if ( !_found )
{
    if ( argument[0] < 100000 )
    {
        show_debug_message( "ds_pool_instance_deactivate - No instances of object \"" + object_get_name( argument[0] ) + "\" exist" );
    }
    else
    {
        show_debug_message( "ds_pool_instance_deactivate - Instance \"" + string( argument[0] ) + "\" doesn't exist" );
    }
}

return (_found && !_error);