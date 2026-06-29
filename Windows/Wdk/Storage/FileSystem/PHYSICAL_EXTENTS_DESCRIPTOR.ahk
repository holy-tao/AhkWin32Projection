#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PHYSICAL_EXTENTS_DESCRIPTOR {
    #StructPack 8

    NumberOfRuns : UInt32

    NumberOfValidRuns : UInt32

    Run : IntPtr[1]

}
