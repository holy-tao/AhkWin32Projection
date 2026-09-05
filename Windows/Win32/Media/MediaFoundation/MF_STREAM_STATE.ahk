#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_STREAM_STATE extends Win32Enum {

    /**
     * Native name: MF_STREAM_STATE_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 0

    /**
     * Native name: MF_STREAM_STATE_PAUSED
     * @type {Integer (Int32)}
     */
    static PAUSED => 1

    /**
     * Native name: MF_STREAM_STATE_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 2
}
