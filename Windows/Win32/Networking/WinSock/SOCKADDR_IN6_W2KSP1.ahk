#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_w2ksp1
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IN6_W2KSP1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    sin6_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sin6_port {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    sin6_flowinfo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {IN6_ADDR}
     */
    sin6_addr{
        get {
            if(!this.HasProp("__sin6_addr"))
                this.__sin6_addr := IN6_ADDR(8, this)
            return this.__sin6_addr
        }
    }

    /**
     * @type {Integer}
     */
    sin6_scope_id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
