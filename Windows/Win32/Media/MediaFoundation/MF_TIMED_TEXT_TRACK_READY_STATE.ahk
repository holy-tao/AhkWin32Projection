#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_TRACK_READY_STATE extends Win32Enum {

    /**
     * Native name: MF_TIMED_TEXT_TRACK_READY_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MF_TIMED_TEXT_TRACK_READY_STATE_LOADING
     * @type {Integer (Int32)}
     */
    static LOADING => 1

    /**
     * Native name: MF_TIMED_TEXT_TRACK_READY_STATE_LOADED
     * @type {Integer (Int32)}
     */
    static LOADED => 2

    /**
     * Native name: MF_TIMED_TEXT_TRACK_READY_STATE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 3
}
