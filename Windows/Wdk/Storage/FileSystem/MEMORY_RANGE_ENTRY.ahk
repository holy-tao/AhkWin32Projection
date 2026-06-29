#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MEMORY_RANGE_ENTRY {
    #StructPack 8

    VirtualAddress : IntPtr

    NumberOfBytes : IntPtr

}
