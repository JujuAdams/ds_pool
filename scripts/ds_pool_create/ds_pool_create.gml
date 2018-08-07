/// @param [max_size]
///
/// Returns an array that contains a list, a map (used as a stack), and the maximum size of the pool

if ( argument_count == 0 ) return [ ds_list_create(), ds_map_create(), -1 ];
return [ ds_list_create(), ds_map_create(), argument[0] ];