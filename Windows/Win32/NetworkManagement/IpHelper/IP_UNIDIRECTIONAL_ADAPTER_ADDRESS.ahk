#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP_UNIDIRECTIONAL_ADAPTER_ADDRESS structure stores the IPv4 addresses associated with a unidirectional adapter.
 * @remarks
 * 
  * The <b>IP_UNIDIRECTIONAL_ADAPTER_ADDRESS</b> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getunidirectionaladapterinfo">GetUnidirectionalAdapterInfo</a>function. A unidirectional adapter is an adapter that can receive
  *     IPv4 datagrams, but can't transmit them.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipexport/ns-ipexport-ip_unidirectional_adapter_address
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_UNIDIRECTIONAL_ADAPTER_ADDRESS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of IPv4 addresses pointed to by the <b>Address</b> member.
     * @type {Integer}
     */
    NumAdapters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a>. Each element of the array specifies an IPv4 address associated with this unidirectional adapter.
     * @type {Array<UInt32>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__AddressProxyArray
        }
    }
}
