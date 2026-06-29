#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The eWINDOW_ADVANCE_METHOD enumeration specifies the window advance mode used for Reliable Multicast.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ne-wsrm-ewindow_advance_method
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct eWINDOW_ADVANCE_METHOD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Window advances based on time. This is the default mode.
     * @type {Integer (Int32)}
     */
    static E_WINDOW_ADVANCE_BY_TIME => 1

    /**
     * Use the receive window as a data cache.
     * @type {Integer (Int32)}
     */
    static E_WINDOW_USE_AS_DATA_CACHE => 2
}
