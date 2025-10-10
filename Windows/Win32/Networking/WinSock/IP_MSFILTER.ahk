#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * The ip_msfilter structure provides multicast filtering parameters for IPv4 addresses.
 * @remarks
 * 
  * The <b>ip_msfilter</b> structure is used with IPv4 addresses. The <b>ip_msfilter</b> structure is passed as an argument  for the <b>SIO_GET_MULTICAST_FILTER</b> and <b>SIO_SET_MULTICAST_FILTER</b> IOCTLs. 
  * 
  * The <b>ip_msfilter</b> structure and related structures used for IPv4 multicast programming are based on IETF recommendations in sections 4 and 8.1 of RFC 3768. For more information, see <a href="http://tools.ietf.org/html/rfc3678">http://www.ietf.org/rfc/rfc3678.txt</a>.
  * 
  * On Windows Vista and later, a set of socket options are available for multicast programming that support IPv6 and IPv4 addresses. These socket options are IP agnostic and can be used on both IPv6 and IPv4. These IP agnostic options use the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_req">GROUP_REQ</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structures and the <b>SIOCSMSFILTER</b>and <b>SIOCGMSFILTER</b> IOCTLs. These are the preferred socket options and IOCTLs for multicast programming on Windows Vista and later.
  * 
  * The <b>imsf_interface</b> member can be an interface index. Any IPv4 address in the 0.x.x.x block (first octet of 0) except for the IPv4 address of 0.0.0.0 is treated as an interface index.
  * An interface index is a 24-bit number. The 0.0.0.0/8 IPv4 address block is not used (this range is reserved). The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function can be used to obtain interface index information to use for the <b>imsf_interface</b> member.
  * 
  * It is recommended that a local IPv4 address or interface index always be specified in the <b>imsf_interface</b> member of the <b>ip_msfilter</b> structure, rather than use the default interface.  This is particularly important on computers with multiple network interfaces and multiple public IPv4 addresses. 
  * 
  * The default interface used for IPv4 multicast is  determined by the networking stack in Windows. An application can determine the default interface used for IPv4 multicast using the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function to retrieve the IPv4 routing table. The network interface with the lowest value for the routing metric for a destination IP address of 224.0.0.0 is the default interface for IPv4 multicast. The routing table can also be displayed from the command prompt with the following command:
  * 
  * <b>route print</b>
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ip-socket-options">IP_MULTICAST_IF</a> socket option can be used to set the default interface to send IPv4 multicast packets. This socket option does not change the default interface used to receive IPv4 multicast packets.
  * 
  * 
  * A typical IPv4  multicast application would use the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ip-socket-options">IP_ADD_MEMBERSHIP</a> socket option with the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-ip_mreq">ip_mreq</a> structure or the <b>IP_ADD_SOURCE_MEMBERSHIP</b> socket option with the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-ip_mreq_source">ip_mreq_source</a> structure to join a multicast group and listen for multicast packets on a specific interface. The <b>IP_MULTICAST_IF</b> socket option would be used to set the interface to send IPv4 multicast packets to the multicast group. The most common scenario would be a multicast application that listens and sends on the same interface for a multicast group. Multiple sockets might be used by a multicast application with one  socket for listening and one or more sockets for sending. 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>ip_msfilter</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
  * 
  * <div class="alert"><b>Note</b>  The <b>IP_MSFILTER</b> and <b>PIP_MSFILTER</b> derived structures are only defined on the Windows SDK released with Windows Vista and later. The <b>ip_msfilter</b> structure should be used on earlier versions of the Windows SDK. </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ns-ws2ipdef-ip_msfilter
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IP_MSFILTER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The IPv4 address of the multicast group.
     * @type {IN_ADDR}
     */
    imsf_multiaddr{
        get {
            if(!this.HasProp("__imsf_multiaddr"))
                this.__imsf_multiaddr := IN_ADDR(this.ptr + 0)
            return this.__imsf_multiaddr
        }
    }

    /**
     * The local IPv4 address of the interface  or the interface index on which the multicast group should be filtered. This value is in network byte order. If this member specifies an IPv4 address of 0.0.0.0, the default IPv4 multicast interface is used.
     * 
     *  To use an interface index of 1 would be the same as an IP address of  0.0.0.1.
     * @type {IN_ADDR}
     */
    imsf_interface{
        get {
            if(!this.HasProp("__imsf_interface"))
                this.__imsf_interface := IN_ADDR(this.ptr + 4)
            return this.__imsf_interface
        }
    }

    /**
     * The multicast filter mode to be used. This parameter can be either MCAST_INCLUDE (value of 0) to include particular multicast sources, or MCAST_EXCLUDE (value of 1) to exclude traffic from  specified sources.
     * 
     * On Windows Server 2003 and Windows XP, these values are defined in the <i>Ws2tcpip.h</i> header file. 
     * 
     * On Windows Vistaand later, these values are defined as enumeration values in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ne-ws2ipdef-multicast_mode_type">MULTICAST_MODE_TYPE</a> enumeration defined in the <i>Ws2ipdef.h</i> header file.
     * @type {Integer}
     */
    imsf_fmode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The number of sources in the <b>imsf_slist</b> member.
     * @type {Integer}
     */
    imsf_numsrc {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structures that specify the IPv4 multicast source addresses to include or exclude.
     * @type {Array<IN_ADDR>}
     */
    imsf_slist{
        get {
            if(!this.HasProp("__imsf_slistProxyArray"))
                this.__imsf_slistProxyArray := Win32FixedArray(this.ptr + 16, 1, IN_ADDR, "")
            return this.__imsf_slistProxyArray
        }
    }
}
