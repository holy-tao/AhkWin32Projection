#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IPX extends Win32Struct
{
    static sizeof => 14

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sa_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    sa_netnum{
        get {
            if(!this.HasProp("__sa_netnumProxyArray"))
                this.__sa_netnumProxyArray := Win32FixedArray(this.ptr + 2, 4, Primitive, "char")
            return this.__sa_netnumProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    sa_nodenum{
        get {
            if(!this.HasProp("__sa_nodenumProxyArray"))
                this.__sa_nodenumProxyArray := Win32FixedArray(this.ptr + 6, 6, Primitive, "char")
            return this.__sa_nodenumProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    sa_socket {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
