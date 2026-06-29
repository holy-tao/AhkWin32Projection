#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REPARSE_INDEX_KEY {
    #StructPack 8

    FileReparseTag : UInt32

    FileId : Int64

}
