#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CACHE_UNINITIALIZE_EVENT {
    #StructPack 8

    Next : CACHE_UNINITIALIZE_EVENT.Ptr

    Event : IntPtr

}
