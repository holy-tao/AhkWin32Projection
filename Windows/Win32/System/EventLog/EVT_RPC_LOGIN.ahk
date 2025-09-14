#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information used to connect to a remote computer.
 * @remarks
 * You can set <b>User</b>, <b>Domain</b>, and <b>Password</b> to <b>NULL</b> to use the credentials of the current user.
  * 
  * If you set <b>Password</b>, consider using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function to clear the password after calling <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ns-winevt-evt_rpc_login
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_RPC_LOGIN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the remote computer to connect to.
     * @type {Pointer<PWSTR>}
     */
    Server {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The user name to use to connect to the remote computer.
     * @type {Pointer<PWSTR>}
     */
    User {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The domain to which the user account belongs. Optional.
     * @type {Pointer<PWSTR>}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The password for the user account.
     * @type {Pointer<PWSTR>}
     */
    Password {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The authentication method to use to authenticate the user when connecting to the remote computer. For possible authentication methods, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_rpc_login_flags">EVT_RPC_LOGIN_FLAGS</a> enumeration.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
