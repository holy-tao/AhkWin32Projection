#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PHYSICAL_MEMORY_DESCRIPTOR {
    #StructPack 8

    NumberOfRuns : UInt32

    NumberOfPages : UInt32

    Run : IntPtr[1]

}
