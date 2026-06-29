#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the outcome status of a WPS session.
 * @see https://learn.microsoft.com/windows/win32/api/wcndevice/ne-wcndevice-wcn_session_status
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_SESSION_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the session is successful.
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_FAILURE_GENERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCN_SESSION_STATUS_FAILURE_TIMEOUT => 2
}
