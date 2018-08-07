/// @param pool
///
/// Undeletes the list index on the top of the stack
/// Returns the value associate with the list index on the top of the stack, or undefined if the stack is empty

var _map = argument0[E_DS_POOL.MAP];

if ( ds_map_empty( _map ) ) return undefined;

var _index = ds_map_find_first( _map );
ds_map_delete( _map, _index );
return ds_list_find_value( argument0[E_DS_POOL.LIST], _index );