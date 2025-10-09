#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * Defines an IP address object.
 * @remarks
 * The <b>ADDRESS_FAMILY</b> value is always specified separately in the structures that contain this IP address object.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_ip_address
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_IP_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {IN_ADDR}
     */
    v4{
        get {
            if(!this.HasProp("__v4"))
                this.__v4 := IN_ADDR(this.ptr + 0)
            return this.__v4
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    v6{
        get {
            if(!this.HasProp("__v6"))
                this.__v6 := IN6_ADDR(this.ptr + 0)
            return this.__v6
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Addr{
        get {
            if(!this.HasProp("__AddrProxyArray"))
                this.__AddrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__AddrProxyArray
        }
    }
}
