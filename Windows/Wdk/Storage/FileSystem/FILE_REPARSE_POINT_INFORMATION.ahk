#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_REPARSE_POINT_INFORMATION {
    #StructPack 8

    FileReference : Int64

    Tag : UInt32

}
