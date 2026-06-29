#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAMS_QUERY_ID_OUTPUT_BUFFER {
    #StructPack 4

    StreamId : UInt32

}
