#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_SOURCE_READER_CONSTANTS extends Win32Enum {

    /**
     * Native name: MF_SOURCE_READER_INVALID_STREAM_INDEX
     * @type {Integer (Int32)}
     */
    static INVALID_STREAM_INDEX => -1

    /**
     * Native name: MF_SOURCE_READER_ALL_STREAMS
     * @type {Integer (Int32)}
     */
    static ALL_STREAMS => -2

    /**
     * Native name: MF_SOURCE_READER_ANY_STREAM
     * @type {Integer (Int32)}
     */
    static ANY_STREAM => -2

    /**
     * Native name: MF_SOURCE_READER_FIRST_AUDIO_STREAM
     * @type {Integer (Int32)}
     */
    static FIRST_AUDIO_STREAM => -3

    /**
     * Native name: MF_SOURCE_READER_FIRST_VIDEO_STREAM
     * @type {Integer (Int32)}
     */
    static FIRST_VIDEO_STREAM => -4

    /**
     * Native name: MF_SOURCE_READER_MEDIASOURCE
     * @type {Integer (Int32)}
     */
    static MEDIASOURCE => -1
}
