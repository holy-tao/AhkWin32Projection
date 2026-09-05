#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the outcome status of a WPS session.
 * @see https://learn.microsoft.com/windows/win32/api/wcndevice/ne-wcndevice-wcn_session_status
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
class WCN_SESSION_STATUS extends Win32Enum {

    /**
     * Indicates that the session is successful.
     * Native name: WCN_SESSION_STATUS_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Native name: WCN_SESSION_STATUS_FAILURE_GENERIC
     * @type {Integer (Int32)}
     */
    static FAILURE_GENERIC => 1

    /**
     * Native name: WCN_SESSION_STATUS_FAILURE_TIMEOUT
     * @type {Integer (Int32)}
     */
    static FAILURE_TIMEOUT => 2
}
