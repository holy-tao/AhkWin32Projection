#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPX_NETNUM_DATA structure provides information about a specified IPX network number. Used in conjunction with getsockopt function calls that specify IPX_GETNETINFO in the optname parameter.
 * @remarks
 * 
 * If information about the IPX network is in the computer's IPX cache, the call will return immediately. If not, RIP requests are used to resolve the information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsnwlink/ns-wsnwlink-ipx_netnum_data
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPX_NETNUM_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * IPX network number for which information is being requested.
     * @type {Array<Byte>}
     */
    netnum{
        get {
            if(!this.HasProp("__netnumProxyArray"))
                this.__netnumProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__netnumProxyArray
        }
    }

    /**
     * Number of hops to the IPX network being queried, in machine order.
     * @type {Integer}
     */
    hopcount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Network delay tick count required to reach the IPX network, in machine order.
     * @type {Integer}
     */
    netdelay {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Adapter number used to reach the IPX network. The adapter number is zero based, such that if eight adapters are on a given computer, they are numbered 0-7.
     * @type {Integer}
     */
    cardnum {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Media Access Control (MAC) address of the next-hop router in the path between the computer and the IPX network. This value is zero if the computer is directly attached to the IPX network.
     * @type {Array<Byte>}
     */
    router{
        get {
            if(!this.HasProp("__routerProxyArray"))
                this.__routerProxyArray := Win32FixedArray(this.ptr + 12, 6, Primitive, "char")
            return this.__routerProxyArray
        }
    }
}
