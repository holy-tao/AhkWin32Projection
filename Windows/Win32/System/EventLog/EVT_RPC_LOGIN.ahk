#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the information used to connect to a remote computer.
 * @remarks
 * 
  * You can set <b>User</b>, <b>Domain</b>, and <b>Password</b> to <b>NULL</b> to use the credentials of the current user.
  * 
  * If you set <b>Password</b>, consider using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function to clear the password after calling <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ns-winevt-evt_rpc_login
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_RPC_LOGIN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the remote computer to connect to.
     * @type {PWSTR}
     */
    Server{
        get {
            if(!this.HasProp("__Server"))
                this.__Server := PWSTR(this.ptr + 0)
            return this.__Server
        }
    }

    /**
     * The user name to use to connect to the remote computer.
     * @type {PWSTR}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := PWSTR(this.ptr + 8)
            return this.__User
        }
    }

    /**
     * The domain to which the user account belongs. Optional.
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 16)
            return this.__Domain
        }
    }

    /**
     * The password for the user account.
     * @type {PWSTR}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := PWSTR(this.ptr + 24)
            return this.__Password
        }
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
