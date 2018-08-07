gml_pragma( "global", "__ds_pool_init" );

global.__ds_pool_object_lookup = ds_map_create();

enum E_DS_POOL
{
    LIST,
    MAP,
    MAX_SIZE
}