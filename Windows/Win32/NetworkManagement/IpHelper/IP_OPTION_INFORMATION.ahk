#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the options to be included in the header of an IP packet.
 * @remarks
 * The <b>IP_OPTION_INFORMATION</b> structure is used to describe the options to be included in the header of an IP packet. On a 64-bit platform, the  <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure should be used.
 * 
 * The values in the <b>TTL</b>, <b>TOS</b> and <b>Flags</b>  members are carried in specific fields in the IP header.
 * 
 * The bytes in the <b>OptionsData</b>  member are carried in the options area that follows the standard IP header. 
 * 
 * With the exception of source route options for IPv4, the options data must be in the format to be transmitted on the wire as specified in 
 * <a href="https://www.ietf.org/rfc/rfc791.txt">RFC 791</a>. An IPv4 source route option should contain the full route, first hop through final destination, in the route data. The first hop is pulled out of the data and the option is reformatted accordingly. Otherwise, the route option should be formatted as specified in 
 * <a href="https://www.ietf.org/rfc/rfc791.txt">RFC 791</a>.
 * 
 * For use with IPv6, the options data must be in the format to be transmitted on the wire as specified in 
 * <a href="https://www.ietf.org/rfc/rfc2460.txt">RFC 2460</a>.
 * 
 * The <b>IP_OPTION_INFORMATION</b> structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure used by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho">IcmpSendEcho</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> functions.
 * 
 * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_option_information
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_OPTION_INFORMATION {
    #StructPack 8

    /**
     * Type: <b>UCHAR</b>
     * 
     * The Time to Live field in an IPv4 packet header. This is the Hop Limit field in an IPv6 header.
     */
    Ttl : Int8

    /**
     * Type: <b>UCHAR</b>
     * 
     * The type of service field in an IPv4 header. This member is currently silently ignored.
     */
    Tos : Int8

    /**
     * Type: <b>UCHAR</b>
     * 
     * The Flags field. In IPv4, this is the Flags field in the IPv4 header. In IPv6, this field is represented by  options headers.
     */
    Flags : Int8

    /**
     * Type: <b>UCHAR</b>
     * 
     * The size, in bytes, of IP options data.
     */
    OptionsSize : Int8

    /**
     * Type: <b>PUCHAR</b>
     * 
     * A pointer to options data.
     */
    OptionsData : IntPtr

}
