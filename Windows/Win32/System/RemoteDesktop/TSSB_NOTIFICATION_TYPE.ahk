#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TSSB_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * Native name: TSSB_NOTIFY_INVALID
     * @type {Integer (Int32)}
     */
    static NOTIFY_INVALID => 0

    /**
     * Native name: TSSB_NOTIFY_TARGET_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_TARGET_CHANGE => 1

    /**
     * Native name: TSSB_NOTIFY_SESSION_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_SESSION_CHANGE => 2

    /**
     * Native name: TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_CONNECTION_REQUEST_CHANGE => 4
}
