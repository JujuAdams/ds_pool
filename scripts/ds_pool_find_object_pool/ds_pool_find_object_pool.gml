/// @param object
///
/// Returns a pool

if ( !ds_map_exists( global.__ds_pool_object_lookup, argument0 ) )
{
    var _pool = ds_pool_create();
    ds_map_add( global.__ds_pool_object_lookup, argument0, _pool );
    show_debug_message( "Creating new pool for " + object_get_name( argument0 ) );
    return _pool;
}

return ds_map_find_value( global.__ds_pool_object_lookup, argument0 );