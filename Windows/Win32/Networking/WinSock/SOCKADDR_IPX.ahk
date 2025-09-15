#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IPX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sa_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {String}
     */
    sa_netnum {
        get => StrGet(this.ptr + 2, 3, "UTF-16")
        set => StrPut(value, this.ptr + 2, 3, "UTF-16")
    }

    /**
     * @type {String}
     */
    sa_nodenum {
        get => StrGet(this.ptr + 10, 5, "UTF-16")
        set => StrPut(value, this.ptr + 10, 5, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    sa_socket {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }
}
