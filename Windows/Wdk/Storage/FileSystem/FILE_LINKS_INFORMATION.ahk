#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_LINKS_INFORMATION {
    #StructPack 8

    BytesNeeded : UInt32

    EntriesReturned : UInt32

    Entry : IntPtr

}
