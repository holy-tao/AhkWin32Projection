#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPNG_ADDRESS union provides Internet Protocol version 4 (IPv4) and Internet Protocol version 6 (IPv6) addresses.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-ipng_address
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class IPNG_ADDRESS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Internet Protocol (IP) address, in version 4 format (IPv4).
     * @type {Integer}
     */
    IpAddrV4 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Internet Protocol (IP) address, in version 6 format (IPv6).
     * @type {Array<Byte>}
     */
    IpAddrV6{
        get {
            if(!this.HasProp("__IpAddrV6ProxyArray"))
                this.__IpAddrV6ProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__IpAddrV6ProxyArray
        }
    }
}
