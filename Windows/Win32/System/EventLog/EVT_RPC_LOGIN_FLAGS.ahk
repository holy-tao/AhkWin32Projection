#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of authentication that you can use to authenticate the user when connecting to a remote computer.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_rpc_login_flags
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_RPC_LOGIN_FLAGS extends Win32Enum {

    /**
     * Use the default authentication method during RPC login. The default authentication method is Negotiate.
     * Native name: EvtRpcLoginAuthDefault
     * @type {Integer (UInt32)}
     */
    static AuthDefault => 0

    /**
     * Use the Negotiate authentication method during RPC login. The client and server negotiate whether to use NTLM or Kerberos.
     * Native name: EvtRpcLoginAuthNegotiate
     * @type {Integer (UInt32)}
     */
    static AuthNegotiate => 1

    /**
     * Use Kerberos authentication during RPC login.
     * Native name: EvtRpcLoginAuthKerberos
     * @type {Integer (UInt32)}
     */
    static AuthKerberos => 2

    /**
     * Use NTLM authentication during RPC login.
     * Native name: EvtRpcLoginAuthNTLM
     * @type {Integer (UInt32)}
     */
    static AuthNTLM => 3
}
