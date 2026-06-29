#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_EVENT_BUFFER {
    #StructPack 4

    NamedPipeState : UInt32

    EntryType : UInt32

    ByteCount : UInt32

    KeyValue : UInt32

    NumberRequests : UInt32

}
