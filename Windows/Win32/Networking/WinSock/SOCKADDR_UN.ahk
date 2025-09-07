#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_UN extends Win32Struct
{
    static sizeof => 218

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sun_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    sun_path {
        get => StrGet(this.ptr + 2, 107, "UTF-16")
        set => StrPut(value, this.ptr + 2, 107, "UTF-16")
    }
}
