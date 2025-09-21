#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Char>}
     */
    sesi10_cname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     * @type {Pointer<Char>}
     */
    sesi10_username {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
