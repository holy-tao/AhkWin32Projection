#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the drain state of a Remote Desktop Session Host (RD Session Host) server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_MACHINE_DRAIN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The drain state of the server is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_UNSPEC => 0

    /**
     * The server is accepting new user sessions.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_OFF => 1

    /**
     * The server is not accepting new user sessions.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_ON => 2
}
