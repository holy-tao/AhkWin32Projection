#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_IPADDRESS_TYPE.ahk" { VDS_IPADDRESS_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The VDS_IPADDRESS structure (vdshwprv.h) defines an IP address and port.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_ipaddress
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_IPADDRESS {
    #StructPack 4

    /**
     * The type of address as enumerated by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_ipaddress_type">VDS_IPADDRESS_TYPE</a>.
     */
    type : VDS_IPADDRESS_TYPE

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV4</b>, then this contains 
     *      the binary IPv4 address in network byte order. The field 3 byte value is contained in bits 0 through 7.  The field 2 byte value is 
     *      contained in bits 8 through 15.  The field 1 byte value is contained in bits 16 through 23.  The field 0 byte 
     *      value is contained in bits 24 through 31.
     */
    ipv4Address : UInt32

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the binary IPv6 address in network byte order.
     */
    ipv6Address : Int8[16]

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the flow information as defined in version 6 of the IP protocol.
     */
    ulIpv6FlowInfo : UInt32

    /**
     * If the <b>type</b> member is <b>VDS_IPT_IPV6</b>, then this contains 
     *      the scope ID as defined in version 6 of the IP protocol.
     */
    ulIpv6ScopeId : UInt32

    /**
     * If the <b>type</b> member is <b>VDS_IPT_TEXT</b>, then this contains 
     *      the text address, either a DNS address or dotted address, in host byte order.
     */
    wszTextAddress : WCHAR[257]

    /**
     * The TCP port number.
     */
    ulPort : UInt32

}
