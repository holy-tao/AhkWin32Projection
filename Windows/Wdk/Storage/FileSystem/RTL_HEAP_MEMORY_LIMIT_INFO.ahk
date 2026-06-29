#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_HEAP_MEMORY_LIMIT_INFO {
    #StructPack 8

    Version : UInt32

    Data : IntPtr

}
