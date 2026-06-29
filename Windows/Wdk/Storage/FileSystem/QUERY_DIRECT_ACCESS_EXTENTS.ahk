#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_DIRECT_ACCESS_EXTENTS {
    #StructPack 8

    FileOffset : Int64

    Length : Int64

    Flags : UInt32

    Reserved : UInt32

}
