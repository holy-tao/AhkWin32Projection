#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_STREAM_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_STREAM_STATE_STOPPED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_STREAM_STATE_PAUSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_STREAM_STATE_RUNNING => 2
}
