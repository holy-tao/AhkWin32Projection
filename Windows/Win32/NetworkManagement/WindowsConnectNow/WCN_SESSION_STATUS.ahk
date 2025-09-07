#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the outcome status of a WPS session.
 * @see https://learn.microsoft.com/windows/win32/api/wcndevice/ne-wcndevice-wcn_session_status
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_SESSION_STATUS{

    /**
     * Indicates that the session is successful.
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_SUCCESS => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_FAILURE_GENERIC => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_FAILURE_TIMEOUT => 2
}
