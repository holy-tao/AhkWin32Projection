#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * The ipv6_mreq structure provides multicast group information for IPv6 addresses.
 * @remarks
 * 
  * The <b>ipv6_mreq</b> structure is used with IPv6 addresses. The <b>ipv6_mreq</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ipv6-socket-options">IPV6_ADD_MEMBERSHIP</a>,  <b>IPV6_DROP_MEMBERSHIP</b>,  <b>IPV6_JOIN_GROUP</b>, and <b>IPV6_LEAVE_GROUP</b> socket options. The <b>IPV6_JOIN_GROUP</b> and <b>IPV6_ADD_MEMBERSHIP</b> socket options are defined to be the same. The <b>IPV6_LEAVE_GROUP</b> and <b>IPV6_DROP_MEMBERSHIP</b> socket options are defined to be the same. 
  * 
  * On Windows Vista and later, a set of socket options are available for multicast programming that support IPv6 and IPv4 addresses. These socket options are IP agnostic and can be used on both IPv6 and IPv4. These IP agnostic options use the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_req">GROUP_REQ</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structures and are the preferred socket options for multicast programming on Windows Vista and later.
  * 
  * The <b>ipv6_mreq</b> structure is the IPv6 equivalent of the IPv4-based <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-ip_mreq">ip_mreq</a> structure.  
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function can be used to obtain interface index information required for the <i>ipv6mr_interface</i> member.
  * 
  * The <b>ipv6_mreq</b> structure and the <b>IPPROTO_IPV6</b> level socket options that use this structure are only valid on datagram and raw sockets (the socket type must be <b>SOCK_DGRAM</b> or <b>SOCK_RAW</b>).
  * 
  * It is recommended that a local IPv6 interface index always be specified in the <b>ipv6mr_interface</b> member of the <b>ipv6_mreq</b> structure, rather than use the default interface.  This is particularly important on computers with multiple network interfaces and multiple public IPv6 addresses. 
  * 
  * The default interface used for IPv6 multicast is  determined by the networking stack in Windows. On Windows Vista and later, an application can determine the default interface used for IPv6 multicast using the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardtable2">GetIpForwardTable2</a> function to retrieve the IPv6 routing table. The network interface with the lowest value for the routing metric for a destination IPv6 multicast address (the FF00::/8 IPv6 address block) is the default interface for IPv6 multicast. The routing table can also be displayed from the command prompt with the following command:
  * 
  * <b>route print</b>
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ipv6-socket-options">IPV6_MULTICAST_IF</a> socket option can be used to set the default interface to send IPv6 multicast packets. This socket option does not change the default interface used to receive IPv6 multicast packets.
  * 
  * 
  * A typical IPv6  multicast application would use the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ipv6-socket-options">IPV6_ADD_MEMBERSHIP</a> or <b>IPV6_JOIN_GROUP</b> socket option with the <b>ipv6_mreq</b> structure to join a multicast group and listen for multicast packets on a specific interface. The <b>IPV6_MULTICAST_IF</b> socket option would be used to set the interface to send IPv6 multicast packets to the multicast group. The most common scenario would be a multicast application that listens and sends on the same interface for a multicast group. Multiple sockets might be used by a multicast application with one  socket for listening and one or more sockets for sending. 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>ipv6_mreq</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
  * 
  * <div class="alert"><b>Note</b>  The <b>PIP6_MREQ</b> derived structure is only defined on the Windows SDK released with Windows Vista and later. The <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_req">GROUP_REQ</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structures and are the preferred socket options for multicast programming on Windows Vista and later.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ns-ws2ipdef-ipv6_mreq
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV6_MREQ extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The address of the IPv6 multicast group.
     * @type {IN6_ADDR}
     */
    ipv6mr_multiaddr{
        get {
            if(!this.HasProp("__ipv6mr_multiaddr"))
                this.__ipv6mr_multiaddr := IN6_ADDR(this.ptr + 0)
            return this.__ipv6mr_multiaddr
        }
    }

    /**
     * The interface index of the local interface on which the multicast group should be joined or dropped. If this member specifies an interface index of 0, the default multicast interface is used.
     * @type {Integer}
     */
    ipv6mr_interface {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
