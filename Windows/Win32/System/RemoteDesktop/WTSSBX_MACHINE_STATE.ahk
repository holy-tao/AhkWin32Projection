#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the current state of a server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_MACHINE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The server state is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_UNSPEC => 0

    /**
     * The server state is ready.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_READY => 1

    /**
     * The server is synchronizing with RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_SYNCHRONIZING => 2
}
