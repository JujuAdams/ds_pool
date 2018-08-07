/// @param x
/// @param y
/// @param layer
/// @param object
/// @param [reactivate_execute_create_event]
/// @param [max_instances]
///
/// Returns the instance ID of a previous pooled instance, or creates a new instance if no pooled instance is available
/// Created instances contain the <__ds_pool_index> variable

if ( !ds_map_exists( global.__ds_pool_object_lookup, argument[3] ) )
{
    if ( argument_count > 5 ) var _pool = ds_pool_create( argument[5] ) else var _pool = ds_pool_create();
    ds_map_add( global.__ds_pool_object_lookup, argument[3], _pool );
}
else
{
    var _pool = ds_map_find_value( global.__ds_pool_object_lookup, argument[3] );
}

var _index = ds_pool_pop_index( _pool );
if ( _index == undefined ) var _instance = undefined else var _instance = ds_pool_find_value( _pool, _index );

if ( _instance != undefined )
{
    instance_activate_object( _instance );
    with( _instance )
    {
        x         = argument[0];
        y         = argument[1];
        depth     = argument[2];
        xstart    = x;
        ystart    = y;
        xprevious = x;
        yprevious = y;
        
        if ( (argument_count > 4) && argument[4] ) event_perform( ev_create, 0 );
        return id;
    }
    
    //The instance didn't exist!
    show_debug_message( "ds_pool_instance_activate_depth - Instance popped from pool (" + string( _instance ) + ") didn't exist. Creating a new instance" );
    _instance = instance_create_depth( argument[0], argument[1], argument[2], argument[3] );
    _instance.__ds_pool_index = _index;
    ds_pool_replace( _pool, _index, _instance );
    return _instance;
}

if ( argument_count > 5 ) 
{
    if ( ds_list_size( _pool[E_DS_POOL.LIST] ) >= argument[5] ) return noone;
}

_instance = instance_create_depth( argument[0], argument[1], argument[2], argument[3] );
_instance.__ds_pool_index = _index;
ds_list_add( _pool[0], _instance );
return _instance;