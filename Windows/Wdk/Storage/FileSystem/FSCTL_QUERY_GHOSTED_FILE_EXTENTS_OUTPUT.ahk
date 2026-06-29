#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_QUERY_GHOSTED_FILE_EXTENTS_OUTPUT {
    #StructPack 4

    ExtentCount : UInt32

    TotalExtentCount : UInt32

    Extents : Int8[1]

}
