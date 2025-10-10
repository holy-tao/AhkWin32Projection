#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_STORAGE_XP extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ss_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {String}
     */
    __ss_pad1 {
        get => StrGet(this.ptr + 2, 5, "UTF-16")
        set => StrPut(value, this.ptr + 2, 5, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    __ss_align {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {String}
     */
    __ss_pad2 {
        get => StrGet(this.ptr + 24, 111, "UTF-16")
        set => StrPut(value, this.ptr + 24, 111, "UTF-16")
    }
}
