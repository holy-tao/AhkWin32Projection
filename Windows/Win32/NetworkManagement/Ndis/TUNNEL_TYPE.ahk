#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TUNNEL_TYPE enumeration type defines the encapsulation method used by a tunnel, as described by the Internet Assigned Names Authority (IANA).
 * @remarks
 * 
  * For more information about the tunnel type as described by the Internet Assigned Names Authority
  *     (IANA) see 
  *     <a href="https://www.iana.org/assignments/ianaiftype-mib">"IANAifType-MIB DEFINITIONS"</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ifdef/ne-ifdef-tunnel_type
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class TUNNEL_TYPE{

    /**
     * Indicates that a tunnel is not specified.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_NONE => 0

    /**
     * Indicates that none of the following tunnel types is specified.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_OTHER => 1

    /**
     * Specifies that a packet is encapsulated directly within a normal IP header, with no intermediate
 *      header, and the packet is sent unicast to the remote tunnel endpoint.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_DIRECT => 2

    /**
     * Specifies that an IPv6 packet is encapsulated directly within an IPv4 header, with no intermediate
 *      header, and the packet is sent unicast to the destination determined by the 6to4 protocol.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_6TO4 => 11

    /**
     * Specifies that an IPv6 packet is encapsulated directly within an IPv4 header, with no intermediate
 *      header, and the packet is sent unicast to the destination determined by the ISATAP protocol.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_ISATAP => 13

    /**
     * Specifies that the tunnel uses Teredo encapsulation.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_TEREDO => 14

    /**
     * Specifies that the tunnel uses IP over Hypertext Transfer Protocol Secure (HTTPS). This tunnel
 *      type is supported in Windows 7 and later versions of the Windows operating system.
     * @type {Integer (Int32)}
     */
    static TUNNEL_TYPE_IPHTTPS => 15
}
