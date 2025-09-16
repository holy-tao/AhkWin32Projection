#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the session, including name of the computer; name of the user; and open files, pipes, and devices on the computer.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SESSION_INFO_1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     * @type {Pointer<PWSTR>}
     */
    sesi1_cname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     * @type {Pointer<PWSTR>}
     */
    sesi1_username {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a DWORD value that contains the number of files, devices, and pipes opened during the session.
     * @type {Integer}
     */
    sesi1_num_opens {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been active.
     * @type {Integer}
     */
    sesi1_time {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been idle.
     * @type {Integer}
     */
    sesi1_idle_time {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    sesi1_user_flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
