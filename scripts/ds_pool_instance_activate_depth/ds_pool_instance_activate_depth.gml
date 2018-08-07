/// @param x
/// @param y
/// @param layer
/// @param object
/// @param [max_instances]                   <- defaults to infinite
/// @param [reactivate_execute_create_event] <- defaults to <false>
///
/// Returns the instance ID of a previous pooled instance, or creates a new instance if no pooled instance is available
/// Created instances contain the <__ds_pool_index> variable

var _pool = ds_pool_find_object_pool( argument[3] );
if ( argument_count > 4 ) _pool[E_DS_POOL.MAX_SIZE] = argument[4];

var _index = ds_pool_pop_index( _pool );
var _instance = (_index == undefined)? undefined : ds_pool_find_value( _pool, _index );

if ( _instance != undefined )
{
    instance_activate_object( id );
    with( _instance )
    {
        x         = argument[0];
        y         = argument[1];
        depth     = argument[2];
        
        #region Motion
        xstart            = x;
        ystart            = y;
        xprevious         = x;
        yprevious         = y;
        speed             = 0;
        direction         = 0;
        hspeed            = 0;
        vspeed            = 0;
        gravity           = 0;
        gravity_direction = 270;
        mask_index        = object_get_mask( object_index );
        solid             = object_get_solid( object_index );
        #endregion
        #region Sprite
        sprite_index      = object_get_sprite( object_index );
        image_index       = 0;
        image_speed       = 1;
        visible           = object_get_visible( object_index );
        image_xscale      = 1;
        image_yscale      = 1;
        image_alpha       = 1;
        image_blend       = c_white;
        #endregion
        #region Alarms, Paths, Persistence, and Timelines
        timeline_index    = -1;
        timeline_running  = false;
        timeline_speed    = 1;
        timeline_position = 0;
        timeline_loop     = false;
        persistent        = object_get_persistent( object_index );
        for( var _i = 0; _i < 12; _i++ ) alarm[_i] = -1;
        path_end();
        #endregion
        
        if ( (argument_count > 5) && argument[5] ) event_perform( ev_create, 0 );
        return id;
    }
    
    //The instance didn't exist!
    show_debug_message( "ds_pool_instance_activate_depth - Instance popped from pool (" + string( _instance ) + ") didn't exist. Creating a new instance" );
    _instance = instance_create_depth( argument[0], argument[1], argument[2], argument[3] );
    _instance.__ds_pool_index = _index;
    ds_pool_replace( _pool, _index, _instance );
    return _instance;
}

var _list_size = ds_list_size( _pool[E_DS_POOL.LIST] );
if ( argument_count > 4 ) && ( _list_size >= argument[4] ) && ( argument[4] >= 0 ) return noone;

_instance = instance_create_depth( argument[0], argument[1], argument[2], argument[3] );
_instance.__ds_pool_index = _list_size;
ds_list_add( _pool[0], _instance );
return _instance;