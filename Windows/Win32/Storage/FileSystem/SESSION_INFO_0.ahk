#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of the computer that established the session.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SESSION_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the name of the computer that established the session. This string cannot contain a backslash (\\).
     * @type {Pointer<Char>}
     */
    sesi0_cname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
