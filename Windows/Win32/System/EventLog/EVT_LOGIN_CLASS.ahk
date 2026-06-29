#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the types of connection methods you can use to connect to the remote computer.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_login_class
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_LOGIN_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use Remote Procedure Call (RPC) login.
     * @type {Integer (Int32)}
     */
    static EvtRpcLogin => 1
}
