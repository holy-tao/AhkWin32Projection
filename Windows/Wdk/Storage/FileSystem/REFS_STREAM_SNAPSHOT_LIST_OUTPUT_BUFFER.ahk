#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_SNAPSHOT_LIST_OUTPUT_BUFFER {
    #StructPack 8

    EntryCount : UInt32

    BufferSizeRequiredForQuery : UInt32

    Reserved : UInt32[2]

    Entries : IntPtr[1]

}
