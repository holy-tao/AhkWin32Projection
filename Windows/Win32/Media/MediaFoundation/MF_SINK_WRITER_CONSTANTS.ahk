#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_SINK_WRITER_CONSTANTS extends Win32Enum {

    /**
     * Native name: MF_SINK_WRITER_INVALID_STREAM_INDEX
     * @type {Integer (UInt32)}
     */
    static INVALID_STREAM_INDEX => 4294967295

    /**
     * Native name: MF_SINK_WRITER_ALL_STREAMS
     * @type {Integer (UInt32)}
     */
    static ALL_STREAMS => 4294967294

    /**
     * Native name: MF_SINK_WRITER_MEDIASINK
     * @type {Integer (UInt32)}
     */
    static MEDIASINK => 4294967295
}
