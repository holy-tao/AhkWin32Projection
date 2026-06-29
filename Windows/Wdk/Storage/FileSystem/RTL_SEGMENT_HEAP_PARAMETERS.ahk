#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_SEGMENT_HEAP_PARAMETERS {
    #StructPack 8

    Version : UInt16

    Size : UInt16

    Flags : UInt32

    MemorySource : IntPtr

    Reserved : IntPtr[4]

}
