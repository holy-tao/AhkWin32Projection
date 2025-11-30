#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_TRACK_READY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_READY_STATE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_READY_STATE_LOADING => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_READY_STATE_LOADED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_READY_STATE_ERROR => 3
}
