/// @param instance_or_object
/// @param [execute_cleanup_event]
/// @param [execute_destroy_event]
///
/// Returns if instance deactivation was successful

with( argument[0] )
{
    if ( !ds_map_exists( global.__ds_pool_object_lookup, object_index ) )
    {
        show_error( "Instance was not created by ds_pool_instance_activate_*()!\n ", false );
        return false;
    }
    else
    {
        var _pool = ds_map_find_value( global.__ds_pool_object_lookup, object_index );
    }
    
    ds_pool_delete( _pool, __ds_pool_index );
    
    if ( (argument_count > 1) && argument[1] ) event_perform( ev_cleanup, 0 );
    if ( (argument_count > 2) && argument[2] ) event_perform( ev_destroy, 0 );
    
    instance_deactivate_object( id );
    return true;
}

show_debug_message( "ds_pool_instance_deactivate - Instance \"" + string( argument[0] ) + "\" didn't exist" );
return false;