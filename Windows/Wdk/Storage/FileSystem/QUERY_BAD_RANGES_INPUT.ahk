#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_BAD_RANGES_INPUT {
    #StructPack 8

    Flags : UInt32

    NumRanges : UInt32

    Ranges : IntPtr[1]

}
