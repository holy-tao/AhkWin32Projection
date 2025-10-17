#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR_STORAGE.ahk

/**
 * Provides multicast group information for IPv6 or IPv4 addresses.
 * @remarks
 * 
  * The <b>GROUP_REQ</b> structure is used with either IPv6 or IPv4 multicast addresses. The <b>GROUP_REQ</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/WinSock/socket-options">MCAST_JOIN_GROUP</a> and MCAST_LEAVE_GROUP socket options. 
  * 
  * The <b>GROUP_REQ</b> structure and related structures used for multicast programming are based on IETF recommendations in sections 5 and 8.2  of RFC 3768. For more information, see <a href="http://tools.ietf.org/html/rfc3678">http://www.ietf.org/rfc/rfc3678.txt</a>.
  * 
  * On Windows Vista and later, a set of socket options are available for multicast programming that support IPv6 and IPv4 addresses. These socket options are IP agnostic and can be used on both IPv6 and IPv4. These IP agnostic options use the <b>GROUP_REQ</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structures and are the preferred socket options for multicast programming on Windows Vista and later.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function can be used to obtain interface index information required for the <i>gr_interface</i> member.
  * 
  * The <b>GROUP_REQ</b> structure and the socket options that use this structure are only valid on datagram and raw sockets (the socket type must be <b>SOCK_DGRAM</b> or <b>SOCK_RAW</b>).
  * 
  * The <b>GROUP_REQ</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ns-ws2ipdef-group_req
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class GROUP_REQ extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * The interface index of the local interface on which the multicast group should be joined or dropped.
     * @type {Integer}
     */
    gr_interface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of the multicast group. This may be either an IPv6 or IPv4 multicast address.
     * @type {SOCKADDR_STORAGE}
     */
    gr_group{
        get {
            if(!this.HasProp("__gr_group"))
                this.__gr_group := SOCKADDR_STORAGE(8, this)
            return this.__gr_group
        }
    }
}
