#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAMS_ASSOCIATE_ID_INPUT_BUFFER {
    #StructPack 4

    Flags : UInt32

    StreamId : UInt32

}
