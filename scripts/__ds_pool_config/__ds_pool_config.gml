#macro DS_POOL_DELETE_OVERWRITE false //Toggles whether to overwrite the old value when using ds_pool_delete()
#macro DS_POOL_DELETE_VALUE undefined //Ignored if <DS_POOL_DELETE_OVERWRITE> is false

enum E_DS_POOL
{
    LIST,
    MAP,
    MAX_SIZE
}