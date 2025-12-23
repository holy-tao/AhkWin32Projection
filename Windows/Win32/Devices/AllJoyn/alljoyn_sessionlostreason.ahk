#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_sessionlostreason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER => 3

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_LINK_TIMEOUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REASON_OTHER => 5
}
