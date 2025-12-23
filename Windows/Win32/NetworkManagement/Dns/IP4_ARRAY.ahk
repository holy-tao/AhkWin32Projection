#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP4_ARRAY structure stores an array of IPv4 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-ip4_array
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class IP4_ARRAY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of IPv4 addresses in <b>AddrArray</b>.
     * @type {Integer}
     */
    AddrCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-data-types">IP4_ADDRESS</a> data types that contains a list of IPv4 address.
     * @type {Array<UInt32>}
     */
    AddrArray{
        get {
            if(!this.HasProp("__AddrArrayProxyArray"))
                this.__AddrArrayProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__AddrArrayProxyArray
        }
    }
}
