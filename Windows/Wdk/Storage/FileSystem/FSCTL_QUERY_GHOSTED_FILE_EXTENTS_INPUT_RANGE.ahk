#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_QUERY_GHOSTED_FILE_EXTENTS_INPUT_RANGE {
    #StructPack 8

    FileOffset : Int64

    ByteCount : Int64

}
