#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPEN_REPARSE_LIST {
    #StructPack 8

    OpenReparseList : IntPtr

}
