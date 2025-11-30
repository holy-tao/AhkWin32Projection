#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TSSB_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TSSB_NOTIFY_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static TSSB_NOTIFY_TARGET_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TSSB_NOTIFY_SESSION_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE => 4
}
