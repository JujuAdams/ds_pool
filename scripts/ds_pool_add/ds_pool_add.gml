/// @param pool
/// @param value
///
/// Returns the list index where <value> was written

var _list = argument0[E_DS_POOL.LIST];
var _map  = argument0[E_DS_POOL.MAP];

var _size = ds_list_size( _list );
if ( _list >= argument0[E_DS_POOL.MAX_SIZE] ) && ( argument0[E_DS_POOL.MAX_SIZE] >= 0 ) return -1;

if ( ds_map_empty( _map ) )
{
    ds_list_add( _list, argument1 );
    return _size;
}

var _index = ds_map_find_first( _map );
ds_map_delete( _map, _index );
ds_list_replace( _list, _index, argument1 );
return _index;