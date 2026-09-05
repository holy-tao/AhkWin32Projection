#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
class alljoyn_sessionlostreason extends Win32Enum {

    /**
     * Native name: ALLJOYN_SESSIONLOST_INVALID
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_INVALID => 0

    /**
     * Native name: ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_REMOTE_END_LEFT_SESSION => 1

    /**
     * Native name: ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY => 2

    /**
     * Native name: ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_REMOVED_BY_BINDER => 3

    /**
     * Native name: ALLJOYN_SESSIONLOST_LINK_TIMEOUT
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_LINK_TIMEOUT => 4

    /**
     * Native name: ALLJOYN_SESSIONLOST_REASON_OTHER
     * @type {Integer (Int32)}
     */
    static SESSIONLOST_REASON_OTHER => 5
}
