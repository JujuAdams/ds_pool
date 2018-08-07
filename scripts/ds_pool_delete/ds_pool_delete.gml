/// @param pool
/// @param index
///
/// Returns if the deletion operation was successful

if ( ds_pool_index_deleted( argument0, argument1 ) ) return false; //Don't try to delete an index that's already deleted

if ( DS_POOL_DELETE_OVERWRITE ) ds_list_replace( argument0[E_DS_POOL.LIST], argument1, DS_POOL_DELETE_VALUE );
ds_map_add( argument0[E_DS_POOL.MAP], argument1, current_time );
return true;