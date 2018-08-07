/// @param pool
///
/// Returns an array containing all elements in the pool's list that are not deleted

var _list = argument0[E_DS_POOL.LIST];
var _map  = argument0[E_DS_POOL.MAP];

var _list_size = ds_list_size( _list );
var _array = array_create( _list_size - ds_map_size( _map ) );

var _i = 0;
var _j = 0;
repeat( _list_size )
{
    var _value = _list[| _i++ ];
    if ( !ds_map_exists( _map, _value ) ) _array[_j++] = _value;
}

return _array;