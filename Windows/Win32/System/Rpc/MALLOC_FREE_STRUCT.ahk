#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MALLOC_FREE_STRUCT {
    #StructPack 8

    pfnAllocate : IntPtr

    pfnFree : IntPtr

}
