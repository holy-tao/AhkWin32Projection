#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an IPv4 network route.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function enumerates the IPv4 route entries on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardtable">MIB_IPFORWARDTABLE</a> structure that contains an array of <b>MIB_IPFORWARDROW</b> structure entries. 
 * 
 * 
 * 
 * The  <b>dwForwardDest</b>, <b>dwForwardMask</b>, and <b>dwForwardNextHop</b> members of the 
 * <b>MIB_IPFORWARDROW</b> structure represent  IPv4 addresses in network byte order. 
 * 
 * The  <b>dwForwardProto</b> member of the 
 * <b>MIB_IPFORWARDROW</b> structure specifies the protocol or routing mechanism that generated the route. Routing protocol identifiers are used to identify route information for the specified routing protocol. For example, <b>MIB_IPPROTO_NETMGMT</b> is used to identify route information for IP  routing set through network management such as the Dynamic Host Configuration Protocol (DCHP), the Simple Network Management Protocol (SNMP), or by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipforwardentry">CreateIpForwardEntry</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipforwardentry">DeleteIpForwardEntry</a> 
 * 		, or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> functions. See 
 * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">Protocol Identifiers</a> for a list of possible protocols and routing mechanisms.
 * 
 * An IPv4 address of 0.0.0.0 in the  <b>dwForwardDest</b> member of the 
 * <b>MIB_IPFORWARDROW</b> structure is considered a
 *                 default route. The <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardtable">MIB_IPFORWARDTABLE</a> may contain multiple <b>MIB_IPFORWARDROW</b> entries with the <b>dwForwardDest</b> member set to 0.0.0.0 when there are multiple network adapters installed.
 * 
 * When <b>dwForwardAge</b> is set to <b>INFINITE</b>, the route will not be removed based on a timeout
 *  
 * value. Any other value for <b>dwForwardAge</b> specifies the number of seconds since the route was added or modified in the network routing table.
 * 
 * 
 * 
 * On Windows Server 2003 or
 *   Windows 2000 Server when the Routing and Remote Access Service (RRAS) is running, the  <b>MIB_IPFORWARDROW</b> entries returned have the <b>dwForwardType</b> and <b>dwForwardAge</b> members set to zero. 
 * 
 * On Windows Vista and Windows Server 2008, the route metric specified in the <b>dwForwardMetric1</b> member of the  <b>MIB_IPFORWARDROW</b> structure represents a combination of the route metric added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  So the <b>dwForwardMetric1</b> member of the  <b>MIB_IPFORWARDROW</b> structure should be equal to or greater than <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. If an application would like to set the route metric to 0, then the <b>dwForwardMetric1</b> member of the <b>MIB_IPFORWARDROW</b> structure  should be set equal to the value of the interface metric specified in the <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
 * 
 * A number of members of the <b>MIB_IPFORWARDROW</b> structure  are not currently used by IPv4 routing. These members include <b>dwForwardPolicy</b>, <b>dwForwardNextHopAS</b>, <b>dwForwardMetric2</b>, <b>dwForwardMetric3</b>, <b>dwForwardMetric4</b>, and <b>dwForwardMetric5</b>. 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipforwardrow
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPFORWARDROW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The destination IPv4 address of the route. An
     *                 entry  with  a IPv4 address of 0.0.0.0 is considered a
     *                 default route.
     * This member cannot be set to a multicast (class D) IPv4 address.
     * @type {Integer}
     */
    dwForwardDest {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 subnet mask to use with the
     *                 destination  IPv4 address  before  being compared to
     *                 the value  in  the  <b>dwForwardDest</b>  member. 
     * 
     * The <b>dwForwardMask</b> value should be applied to the destination  IPv4 address (logical and operation) before a comparison with the  value  in  the  <b>dwForwardDest</b> member.
     * @type {Integer}
     */
    dwForwardMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The set of conditions that would cause the selection of a multi-path route (the set of
     *                 next hops for a given destination). This member is typically in IP TOS format. This encoding of this member is described in 
     * RFC 1354. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>.
     * @type {Integer}
     */
    dwForwardPolicy {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * For remote routes, the IPv4 address of the next system en route. Otherwise, this member should be an IPv4 address of 0.0.0.0.
     * @type {Integer}
     */
    dwForwardNextHop {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the local interface through  which  the next hop of this
     *                 route should be reached.
     * @type {Integer}
     */
    dwForwardIfIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwForwardType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ForwardType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwForwardProto {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ForwardProto {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds  since  the  route  was
     *                 added or modified in the network routing table.
     * @type {Integer}
     */
    dwForwardAge {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The autonomous system number of the next hop. When  this  member is  unknown  or not relevant to the
     *                 protocol or routing mechanism specified in <b>dwForwardProto</b>, this value  should be set to zero. This value is documented in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardNextHopAS {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The primary routing metric value for this route. The  semantics of this metric are determined by
     *                 the routing protocol specified in  the  <b>dwForwardProto</b>  member. If  this metric is not
     *                 used, its value should be set to -1. This value is documented in 
     * in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardMetric1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An alternate  routing metric value for this route. The  semantics of this metric are determined by
     *                 the routing protocol specified in  the  <b>dwForwardProto</b>  member. If  this metric is not
     *                 used, its value should be set to -1. This value is documented in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardMetric2 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An alternate  routing metric value for this route. The  semantics of this metric are determined by
     *                 the routing protocol specified in  the  <b>dwForwardProto</b>  member. If  this metric is not
     *                 used, its value should be set to -1. This value is documented in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardMetric3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An alternate  routing metric value for this route. The  semantics of this metric are determined by
     *                 the routing protocol specified in  the  <b>dwForwardProto</b>  member. If  this metric is not
     *                 used, its value should be set to -1. This value is documented in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardMetric4 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An alternate  routing metric value for this route. The  semantics of this metric are determined by
     *                 the routing protocol specified in  the  <b>dwForwardProto</b>  member. If  this metric is not
     *                 used, its value should be set to -1. This value is documented in 
     * RFC 1354. For more information, see <a href="https://www.ietf.org/rfc/rfc1354.txt">http://www.ietf.org/rfc/rfc1354.txt</a>
     * @type {Integer}
     */
    dwForwardMetric5 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
