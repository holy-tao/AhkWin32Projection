#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the connection state of a user session.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_session_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_SESSION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The session state is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_UNSPEC => 0

    /**
     * The user session is active.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_ACTIVE => 1

    /**
     * The user session is disconnected.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_DISCONNECTED => 2
}
