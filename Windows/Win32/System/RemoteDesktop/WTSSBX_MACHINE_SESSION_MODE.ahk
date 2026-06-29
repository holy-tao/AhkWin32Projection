#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the session mode of a Remote Desktop Session Host (RD Session Host) server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_session_mode
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_MACHINE_SESSION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The session mode of the server is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_UNSPEC => 0

    /**
     * The server is in single session mode. It can only accept one session per user.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_SINGLE => 1

    /**
     * The server is in multiple session mode. It can accept multiple sessions per user.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_MULTIPLE => 2
}
