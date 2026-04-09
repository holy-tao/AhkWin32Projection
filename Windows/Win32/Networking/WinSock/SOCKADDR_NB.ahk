#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKADDR_NB extends Win32Struct {
    static sizeof => 20

    static packingSize => 2

    /**
     * @type {Integer}
     */
    snb_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    snb_type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {String}
     */
    snb_name {
        get => StrGet(this.ptr + 4, 15, "UTF-8")
        set => StrPut(value, this.ptr + 4, 15, "UTF-8")
    }
}
