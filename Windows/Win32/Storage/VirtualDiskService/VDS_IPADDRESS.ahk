#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_IPADDRESS structure (vdshwprv.h) defines an IP address and port.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_ipaddress
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_IPADDRESS extends Win32Struct
{
    static sizeof => 552

    static packingSize => 4

    /**
     * The type of address as enumerated by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_ipaddress_type">VDS_IPADDRESS_TYPE</a>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV4</b>, then this contains 
     *      the binary IPv4 address in network byte order. The field 3 byte value is contained in bits 0 through 7.  The field 2 byte value is 
     *      contained in bits 8 through 15.  The field 1 byte value is contained in bits 16 through 23.  The field 0 byte 
     *      value is contained in bits 24 through 31.
     * @type {Integer}
     */
    ipv4Address {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the binary IPv6 address in network byte order.
     * @type {Array<Byte>}
     */
    ipv6Address{
        get {
            if(!this.HasProp("__ipv6AddressProxyArray"))
                this.__ipv6AddressProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__ipv6AddressProxyArray
        }
    }

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the flow information as defined in version 6 of the IP protocol.
     * @type {Integer}
     */
    ulIpv6FlowInfo {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the scope ID as defined in version 6 of the IP protocol.
     * @type {Integer}
     */
    ulIpv6ScopeId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * If the <b>type</b> member is <b>VDS_IPT_TEXT</b>, then this contains 
     *      the text address, either a DNS address or dotted address, in host byte order.
     * @type {String}
     */
    wszTextAddress {
        get => StrGet(this.ptr + 32, 256, "UTF-16")
        set => StrPut(value, this.ptr + 32, 256, "UTF-16")
    }

    /**
     * The TCP port number.
     * @type {Integer}
     */
    ulPort {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }
}
