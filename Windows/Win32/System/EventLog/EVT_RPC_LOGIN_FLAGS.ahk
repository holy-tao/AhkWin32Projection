#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the types of authentication that you can use to authenticate the user when connecting to a remote computer.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_rpc_login_flags
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_RPC_LOGIN_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the default authentication method during RPC login. The default authentication method is Negotiate.
     * @type {Integer (UInt32)}
     */
    static EvtRpcLoginAuthDefault => 0

    /**
     * Use the Negotiate authentication method during RPC login. The client and server negotiate whether to use NTLM or Kerberos.
     * @type {Integer (UInt32)}
     */
    static EvtRpcLoginAuthNegotiate => 1

    /**
     * Use Kerberos authentication during RPC login.
     * @type {Integer (UInt32)}
     */
    static EvtRpcLoginAuthKerberos => 2

    /**
     * Use NTLM authentication during RPC login.
     * @type {Integer (UInt32)}
     */
    static EvtRpcLoginAuthNTLM => 3
}
