#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about the session, including name of the computer; name of the user; and active and idle times for the session.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_10
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SESSION_INFO_10 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     * @type {PWSTR}
     */
    sesi10_cname{
        get {
            if(!this.HasProp("__sesi10_cname"))
                this.__sesi10_cname := PWSTR(this.ptr + 0)
            return this.__sesi10_cname
        }
    }

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     * @type {PWSTR}
     */
    sesi10_username{
        get {
            if(!this.HasProp("__sesi10_username"))
                this.__sesi10_username := PWSTR(this.ptr + 8)
            return this.__sesi10_username
        }
    }

    /**
     * Specifies the number of seconds the session has been active.
     * @type {Integer}
     */
    sesi10_time {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of seconds the session has been idle.
     * @type {Integer}
     */
    sesi10_idle_time {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
