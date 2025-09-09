#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR_STORAGE.ahk

/**
 * Provides multicast filtering parameters for multicast IPv6 or IPv4 addresses.
 * @remarks
 * The <b>GROUP_FILTER</b> structure is used with either IPv6 or IPv4 multicast addresses. The <b>GROUP_FILTER</b> structure is passed as an argument  for the <b>SIOCGMSFILTER</b> and <b>SIOCSMSFILTER</b> IOCTLs.  
  * 
  * The <b>GROUP_FILTER</b> structure and related structures used for multicast programming are based on IETF recommendations in sections 5 and 8.2  of RFC 3768. For more information, see <a href="http://tools.ietf.org/html/rfc3678">http://www.ietf.org/rfc/rfc3678.txt</a>.
  * 
  * On Windows Vista and later, a set of socket options are available for multicast programming that support IPv6 and IPv4 addresses. These socket options are IP agnostic and can be used on both IPv6 and IPv4. These IP agnostic options use the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_req">GROUP_REQ</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structures and are the preferred socket options for multicast programming on Windows Vista and later.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function can be used to obtain interface index information required for the <i>gf_interface</i> member.
  * 
  * The <b>GROUP_FILTER</b> structure and the Ioctls that use this structure are only valid on datagram and raw sockets (the socket type must be <b>SOCK_DGRAM</b> or <b>SOCK_RAW</b>).
  * 
  * The <b>GROUP_FILTER</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-group_filter
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class GROUP_FILTER extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * The interface index of the local interface for the multicast group to filter.
     * @type {Integer}
     */
    gf_interface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The multicast address group that should be filtered. This may be either an IPv6 or IPv4 multicast address.
     * @type {SOCKADDR_STORAGE}
     */
    gf_group{
        get {
            if(!this.HasProp("__gf_group"))
                this.__gf_group := SOCKADDR_STORAGE(this.ptr + 8)
            return this.__gf_group
        }
    }

    /**
     * The multicast filter mode. 
     * 
     * This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ne-ws2ipdef-multicast_mode_type">MULTICAST_MODE_TYPE</a> enumeration type defined in the <i>Ws2ipdef.h</i> header file. This member determines if the list of IP addresses in the <b>gf_numsrc</b> member should be included or excluded.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCAST_INCLUDE"></a><a id="mcast_include"></a><dl>
     * <dt><b>MCAST_INCLUDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter contains a list of IP addresses to include. 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_MCAST_EXCLUDE"></a><a id="_mcast_exclude"></a><dl>
     * <dt><b> MCAST_EXCLUDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter contains a list of IP addresses to exclude. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    gf_fmode {
        get => NumGet(this, 256, "int")
        set => NumPut("int", value, this, 256)
    }

    /**
     * The number of multicast filter source address entries in the <b>gf_slist</b> member.
     * @type {Integer}
     */
    gf_numsrc {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structures specifying the multicast source addresses to include or exclude. These IP addresses may be either IPv6 or IPv4 addresses, but they must be the same address family (IPv6 or IPv4) as the address specified in the <b>gf_group</b> member..
     * @type {Array<SOCKADDR_STORAGE>}
     */
    gf_slist{
        get {
            if(!this.HasProp("__gf_slistProxyArray"))
                this.__gf_slistProxyArray := Win32FixedArray(this.ptr + 264, 1, SOCKADDR_STORAGE, "")
            return this.__gf_slistProxyArray
        }
    }
}
