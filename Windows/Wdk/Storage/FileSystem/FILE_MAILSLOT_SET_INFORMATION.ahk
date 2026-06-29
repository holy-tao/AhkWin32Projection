#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_MAILSLOT_SET_INFORMATION {
    #StructPack 8

    ReadTimeout : IntPtr

}
