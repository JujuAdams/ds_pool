/// @param object
/// @param execute_event_flag
///
/// Returns if the destruction of all pooled instances of the specified object type was successful

if ( !ds_map_exists( global.__ds_pool_object_lookup, argument0 ) )
{
    show_debug_message( "No object pool found for \"" + object_get_name( argument0 ) + "\"" );
    return false;
}

var _pool = ds_map_find_value( global.__ds_pool_object_lookup, argument0 );
var _list = _pool[E_DS_POOL.LIST];

for( var _i = ds_list_size( _list )-1; _i >= 0; _i-- )
{
    var _id = ds_list_find_value( _list, _i );
    instance_activate_object( _id );
    instance_destroy( _id, argument1 );
}

ds_list_clear( _list );
ds_map_clear( _pool[E_DS_POOL.MAP] );

return true;