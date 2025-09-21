#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk

/**
 * The IP_ADAPTER_ADDRESSES_LH structure (iptypes.h) is the header node for a linked list of addresses for a particular adapter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function retrieves 
  *      information for IPv4 and IPv6 addresses and returns this information as a linked list of 
  *      <b>IP_ADAPTER_ADDRESSES</b> structures
  * 
  * The adapter index values specified in the <b>IfIndex</b> and <b>Ipv6IfIndex</b> members may change when an adapter is 
  *      disabled and then enabled, or under other circumstances, and should not be considered persistent.
  * 
  * The values for the <b>IfType</b> member are defined in the 
  *      <i>Ipifcons.h</i> header file. Only the possible values listed in the description of the 
  *      <b>IfType</b> member are currently supported.
  * 
  * The size of the <b>IP_ADAPTER_ADDRESSES</b> structure 
  *      changed on Windows XP with SP1 and later. The size of the 
  *      <b>IP_ADAPTER_ADDRESSES</b> structure also changed on 
  *      Windows Vista and later. The size of the 
  *      <b>IP_ADAPTER_ADDRESSES</b> structure also changed on 
  *      Windows Vista with SP1and later and onWindows Server 2008 and later. The <b>Length</b> member should be used to determine 
  *      which version of the <b>IP_ADAPTER_ADDRESSES</b> 
  *      structure is being used.
  * 
  * The version of the <b>IP_ADAPTER_ADDRESSES</b> 
  *      structure on Windows XP with SP1 and later has the following new members added: 
  *      <b>Ipv6IfIndex</b>, <b>ZoneIndices</b>, and 
  *      <b>FirstPrefix</b>.
  * 
  * The version of the <b>IP_ADAPTER_ADDRESSES</b> 
  *      structure on Windows Vista and later has the following new members added: 
  *      <b>TransmitLinkSpeed</b>, <b>ReceiveLinkSpeed</b>, 
  *      <b>FirstWinsServerAddress</b>, <b>FirstGatewayAddress</b>, 
  *      <b>Ipv4Metric</b>, <b>Ipv6Metric</b>, <b>Luid</b>, 
  *      <b>Dhcpv4Server</b>, <b>CompartmentId</b>, 
  *      <b>NetworkGuid</b>, <b>ConnectionType</b>, 
  *      <b>TunnelType</b>, <b>Dhcpv6Server</b>, 
  *      <b>Dhcpv6ClientDuid</b>, <b>Dhcpv6ClientDuidLength</b>, and 
  *      <b>Dhcpv6Iaid</b>.
  * 
  * The version of the <b>IP_ADAPTER_ADDRESSES</b> 
  *      structure on Windows Vista with SP1and later and on Windows Server 2008 and later has the following new member added:
  *      <b>FirstDnsSuffix</b>.
  * 
  * The <b>Ipv4Metric</b> and <b>Ipv6Metric</b> members are used to 
  *      prioritize route metrics for routes connected to multiple interfaces on the local computer.
  * 
  * The order of  linked <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a> structures pointed to by the <b>FirstUnicastAddress</b> 
  *     member that are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function does not reflect the order that IP addresses were added to an adapter and may vary between versions of Windows. Similarly, the order of linked <b>IP_ADAPTER_ANYCAST_ADDRESS</b> structures pointed to by the <b>FirstAnycastAddress</b> 
  *     member and the order of linked <b>IP_ADAPTER_MULTICAST_ADDRESS</b> structures pointed to by the <b>FirstMulticastAddress 
  * </b> 
  *     member do not reflect the order that IP addresses were added to an adapter and may vary between versions of Windows. 
  * 
  *  In addition, the linked <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a> structures pointed to by the <b>FirstUnicastAddress</b> 
  *     member and the linked <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_prefix_xp">IP_ADAPTER_PREFIX</a> structures pointed to by the <b>FirstPrefix</b> 
  *     member are maintained as separate internal linked lists by the operating system. As a result, the order of linked <b>IP_ADAPTER_UNICAST_ADDRESS</b> structures pointed to by the <b>FirstUnicastAddress</b> 
  *     member does not have any relationship with the order of linked <b>IP_ADAPTER_PREFIX</b> structures pointed to by the <b>FirstPrefix</b> 
  *     member. 
  * 
  * On Windows Vista and later, the linked <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_prefix_xp">IP_ADAPTER_PREFIX</a> structures pointed to by the <b>FirstPrefix</b> 
  *     member include three IP adapter prefixes for each IP address assigned to the adapter. These include the host IP address prefix, the subnet IP address prefix, and the subnet broadcast IP address prefix. In addition, for each adapter there is a multicast address prefix and a broadcast address prefix.
  * 
  * On Windows XP with SP1 and later prior to Windows Vista, the linked <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_prefix_xp">IP_ADAPTER_PREFIX</a> structures pointed to by the <b>FirstPrefix</b> 
  *     member include only a single IP adapter prefix for each IP address assigned to the adapter. 
  * 
  * In the Windows SDK, the version of the structure for use on Windows Vista and later is  defined as 
  *      <b>IP_ADAPTER_ADDRESSES_LH</b>. In the 
  *      Microsoft Windows Software Development Kit (SDK), the version of this structure to be used on earlier systems including 
  *      Windows XP with SP1 and later is defined as 
  *      <b>IP_ADAPTER_ADDRESSES_XP</b>. When compiling an 
  *      application if the target platform is Windows Vista and later 
  *      (<c>NTDDI_VERSION &gt;= NTDDI_LONGHORN</c>, 
  *      <c>_WIN32_WINNT &gt;= 0x0600</c>, or 
  *      <c>WINVER &gt;= 0x0600</c>), the 
  *      <b>IP_ADAPTER_ADDRESSES_LH</b> structure is typedefed to 
  *      the <b>IP_ADAPTER_ADDRESSES</b> structure. When compiling an application if the target 
  *      platform is not Windows Vista and later, the 
  *      <b>IP_ADAPTER_ADDRESSES_XP</b> structure is typedefed to 
  *      the <b>IP_ADAPTER_ADDRESSES</b> structure.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure is used in the 
  *      <b>IP_ADAPTER_ADDRESSES</b> structure. On the 
  *      Windows SDK released for Windows Vista and later, the organization of header files has 
  *      changed and the <b>SOCKET_ADDRESS</b> structure is defined 
  *      in the <i>Ws2def.h</i> header file which is automatically included by the 
  *      <i>Winsock2.h</i> header file. On the Platform Software Development Kit (SDK) released for 
  *      Windows Server 2003 and Windows XP, the 
  *      <b>SOCKET_ADDRESS</b> structure is declared in the 
  *      <i>Winsock2.h</i> header file. In order to use the 
  *      <b>IP_ADAPTER_ADDRESSES</b> structure, the 
  *      <i>Winsock2.h</i> header file must be included before the 
  *      <i>Iphlpapi.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_addresses_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_ADDRESSES_LH extends Win32Struct
{
    static sizeof => 448

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IfIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>struct _IP_ADAPTER_ADDRESSES*</b>
     * 
     * A pointer to the next adapter addresses structure in the list.
     * @type {Pointer<IP_ADAPTER_ADDRESSES_LH>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>PCHAR</b>
     * 
     * An array of characters that contains the name of the adapter with which these addresses are associated. 
     *       Unlike an adapter's friendly name, the adapter name specified in <b>AdapterName</b> is 
     *       permanent and cannot be modified by the user.
     * @type {Pointer<Byte>}
     */
    AdapterName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>PIP_ADAPTER_UNICAST_ADDRESS</b>
     * 
     * A pointer to the first 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a> structure in a 
     *       linked list of IP unicast addresses for the adapter.
     * @type {Pointer<IP_ADAPTER_UNICAST_ADDRESS_LH>}
     */
    FirstUnicastAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>PIP_ADAPTER_ANYCAST_ADDRESS</b>
     * 
     * A pointer to the first 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_anycast_address_xp">IP_ADAPTER_ANYCAST_ADDRESS</a> structure in a 
     *       linked list of IP anycast addresses for the adapter.
     * @type {Pointer<IP_ADAPTER_ANYCAST_ADDRESS_XP>}
     */
    FirstAnycastAddress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>PIP_ADAPTER_MULTICAST_ADDRESS</b>
     * 
     * A pointer to the first 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_multicast_address_xp">IP_ADAPTER_MULTICAST_ADDRESS</a> structure 
     *       in a list of IP multicast addresses for the adapter.
     * @type {Pointer<IP_ADAPTER_MULTICAST_ADDRESS_XP>}
     */
    FirstMulticastAddress {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>PIP_ADAPTER_DNS_SERVER_ADDRESS</b>
     * 
     * A pointer to the first 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_dns_server_address_xp">IP_ADAPTER_DNS_SERVER_ADDRESS</a> structure 
     *       in a linked list of DNS server addresses for the adapter.
     * @type {Pointer<IP_ADAPTER_DNS_SERVER_ADDRESS_XP>}
     */
    FirstDnsServerAddress {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>PWCHAR</b>
     * 
     * The Domain Name System (DNS) suffix associated with this adapter.
     * @type {Pointer<Char>}
     */
    DnsSuffix {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>PWCHAR</b>
     * 
     * A description for the adapter. This member is read-only.
     * @type {Pointer<Char>}
     */
    Description {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>PWCHAR</b>
     * 
     * A user-friendly name for the adapter. For example: "Local Area Connection 1." This name appears in contexts 
     *       such as the <b>ipconfig</b> command line program and the Connection folder. This member is read 
     *       only and can't be modified using any IP Helper functions.
     *       
     * 
     * This member is the ifAlias field used by NDIS as described in 
     *        <a href="https://www.ietf.org/rfc/rfc2863.txt">RFC 2863</a>. The ifAlias field can be set by an 
     *        NDIS interface provider when the NDIS driver is installed. For NDIS miniport drivers, this field is set by 
     *        NDIS.
     * @type {Pointer<Char>}
     */
    FriendlyName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>BYTE[MAX_ADAPTER_ADDRESS_LENGTH]</b>
     * 
     * The Media Access Control (MAC) address for the adapter. For example, on an Ethernet network this member 
     *       would specify the Ethernet hardware address.
     * @type {Array<Byte>}
     */
    PhysicalAddress{
        get {
            if(!this.HasProp("__PhysicalAddressProxyArray"))
                this.__PhysicalAddressProxyArray := Win32FixedArray(this.ptr + 80, 8, Primitive, "char")
            return this.__PhysicalAddressProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the address specified in the <b>PhysicalAddress</b> member. 
     *       For interfaces that do not have a data-link layer, this value is zero.
     * @type {Integer}
     */
    PhysicalAddressLength {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum transmission unit (MTU) size, in bytes.
     * @type {Integer}
     */
    Mtu {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The interface type as defined by the Internet Assigned Names Authority (IANA). Possible values for the 
     *       interface type are listed in the <i>Ipifcons.h</i> header file.
     *       
     * 
     * The table below lists common values for the interface type although many other values are possible. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_OTHER"></a><a id="if_type_other"></a><dl>
     * <dt><b>IF_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some other type of network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ETHERNET_CSMACD"></a><a id="if_type_ethernet_csmacd"></a><dl>
     * <dt><b>IF_TYPE_ETHERNET_CSMACD</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Ethernet network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ISO88025_TOKENRING"></a><a id="if_type_iso88025_tokenring"></a><dl>
     * <dt><b>IF_TYPE_ISO88025_TOKENRING</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A token ring network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_PPP"></a><a id="if_type_ppp"></a><dl>
     * <dt><b>IF_TYPE_PPP</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A PPP network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_SOFTWARE_LOOPBACK"></a><a id="if_type_software_loopback"></a><dl>
     * <dt><b>IF_TYPE_SOFTWARE_LOOPBACK</b></dt>
     * <dt>24</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A software loopback network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ATM"></a><a id="if_type_atm"></a><dl>
     * <dt><b>IF_TYPE_ATM</b></dt>
     * <dt>37</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ATM network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_IEEE80211"></a><a id="if_type_ieee80211"></a><dl>
     * <dt><b>IF_TYPE_IEEE80211</b></dt>
     * <dt>71</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IEEE 802.11 wireless network interface. 
     * 
     * On Windows Vista and later, wireless network 
     *         cards are reported as <b>IF_TYPE_IEEE80211</b>. On earlier versions of  Windows, wireless 
     *         network cards are reported as <b>IF_TYPE_ETHERNET_CSMACD</b>. 
     * 
     * On Windows XP with SP3 and on Windows XP with SP2 x86 with the Wireless LAN API for Windows XP with SP2 installed, the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function can be used to enumerate wireless interfaces on the local computer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_TUNNEL"></a><a id="if_type_tunnel"></a><dl>
     * <dt><b>IF_TYPE_TUNNEL</b></dt>
     * <dt>131</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A tunnel type encapsulation network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_IEEE1394"></a><a id="if_type_ieee1394"></a><dl>
     * <dt><b>IF_TYPE_IEEE1394</b></dt>
     * <dt>144</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IEEE 1394 (Firewire) high performance serial bus network interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    IfType {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>IF_OPER_STATUS</b>
     * 
     * The operational status for the interface as defined in RFC 2863.  For more information, see 
     *       <a href="https://www.ietf.org/rfc/rfc2863.txt">http://www.ietf.org/rfc/rfc2863.txt</a>. This 
     *       member can be one of the values from the <b>IF_OPER_STATUS</b> enumeration type defined in 
     *       the <i>Iftypes.h</i> header file. On Windows Vista and later, the header files 
     *       were reorganized and this enumeration is defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusUp"></a><a id="ifoperstatusup"></a><a id="IFOPERSTATUSUP"></a><dl>
     * <dt><b>IfOperStatusUp</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is up and able to pass packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusDown"></a><a id="ifoperstatusdown"></a><a id="IFOPERSTATUSDOWN"></a><dl>
     * <dt><b>IfOperStatusDown</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is down and not in a condition to pass packets. The 
     *         <b>IfOperStatusDown</b> state has two meanings, depending on the value of 
     *         <b>AdminStatus</b> member. If <b>AdminStatus</b> is not set to 
     *         <b>NET_IF_ADMIN_STATUS_DOWN</b> and <b>ifOperStatus</b> is set to 
     *         <b>IfOperStatusDown</b> then a fault condition is presumed to exist on the interface. If 
     *         <b>AdminStatus</b> is set to <b>IfOperStatusDown</b>, then 
     *         <b>ifOperStatus</b> will normally also be set to 
     *         <b>IfOperStatusDown</b> or <b>IfOperStatusNotPresent</b> and there 
     *         is not necessarily a fault condition on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusTesting"></a><a id="ifoperstatustesting"></a><a id="IFOPERSTATUSTESTING"></a><dl>
     * <dt><b>IfOperStatusTesting</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is in testing mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusUnknown"></a><a id="ifoperstatusunknown"></a><a id="IFOPERSTATUSUNKNOWN"></a><dl>
     * <dt><b>IfOperStatusUnknown</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operational status of the interface is unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusDormant"></a><a id="ifoperstatusdormant"></a><a id="IFOPERSTATUSDORMANT"></a><dl>
     * <dt><b>IfOperStatusDormant</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not actually in a condition to pass packets (it is not up), but is in a pending state, 
     *         waiting for some external event. For on-demand interfaces, this new state identifies the situation where the 
     *         interface is waiting for events to place it in the <b>IfOperStatusUp</b> state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusNotPresent"></a><a id="ifoperstatusnotpresent"></a><a id="IFOPERSTATUSNOTPRESENT"></a><dl>
     * <dt><b>IfOperStatusNotPresent</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A refinement on the <b>IfOperStatusDown</b> state which indicates that the relevant 
     *         interface is down specifically because some component (typically, a hardware component) is not present in the 
     *         managed system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusLowerLayerDown"></a><a id="ifoperstatuslowerlayerdown"></a><a id="IFOPERSTATUSLOWERLAYERDOWN"></a><dl>
     * <dt><b>IfOperStatusLowerLayerDown</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A refinement on the <b>IfOperStatusDown</b> state. This new state indicates that 
     *         this interface runs on top of one or more other interfaces and that this interface is down specifically 
     *         because one or more of these lower-layer interfaces are down.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    OperStatus {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The interface index for the IPv6 IP address. This member is zero if IPv6 is not available on the interface.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows XP with SP1 and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    Ipv6IfIndex {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>DWORD[16]</b>
     * 
     * An array of scope IDs for each scope level used for composing 
     *       <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structures. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ne-ws2def-scope_level">SCOPE_LEVEL</a> enumeration is used to index the array. On 
     *       IPv6, a single interface may be assigned multiple IPv6 multicast addresses based on a scope ID.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows XP with SP1 and later.</div>
     * <div> </div>
     * @type {Array<UInt32>}
     */
    ZoneIndices{
        get {
            if(!this.HasProp("__ZoneIndicesProxyArray"))
                this.__ZoneIndicesProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "uint")
            return this.__ZoneIndicesProxyArray
        }
    }

    /**
     * Type: <b>PIP_ADAPTER_PREFIX</b>
     * 
     * A pointer to the first <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_prefix_xp">IP_ADAPTER_PREFIX</a> 
     *       structure in a linked list of IP adapter prefixes  for the adapter.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows XP with SP1 and later.</div>
     * <div> </div>
     * @type {Pointer<IP_ADAPTER_PREFIX_XP>}
     */
    FirstPrefix {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The current speed in bits per second of the transmit link for the adapter.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    TransmitLinkSpeed {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The current speed in bits per second of the receive link for the adapter.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    ReceiveLinkSpeed {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Type: <b>PIP_ADAPTER_WINS_SERVER_ADDRESS_LH</b>
     * 
     * A pointer to the first 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_wins_server_address_lh">IP_ADAPTER_WINS_SERVER_ADDRESS</a> structure in a linked  list of Windows Internet Name Service  (WINS) server 
     *       addresses for the adapter.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Pointer<IP_ADAPTER_WINS_SERVER_ADDRESS_LH>}
     */
    FirstWinsServerAddress {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Type: <b>PIP_ADAPTER_GATEWAY_ADDRESS_LH</b>
     * 
     * A pointer to the first <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_gateway_address_lh">IP_ADAPTER_GATEWAY_ADDRESS</a> structure in a linked 
     *       list of gateways for the adapter.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Pointer<IP_ADAPTER_GATEWAY_ADDRESS_LH>}
     */
    FirstGatewayAddress {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The IPv4 interface metric for the adapter address. This member is only applicable to an IPv4 adapter 
     *       address.
     * 
     * The actual route metric used to compute the route preferences for IPv4 is the summation of the route metric 
     *        offset specified in the <b>Metric</b> member of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure and the interface 
     *        metric specified in this member for IPv4.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    Ipv4Metric {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The IPv6 interface metric for the adapter address. This member is only applicable to an IPv6 adapter 
     *       address.
     *       
     * 
     * The actual route metric used to compute the route preferences for IPv6 is the summation of the route metric 
     *        offset specified in the <b>Metric</b> member of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure and the interface 
     *        metric specified in this member for IPv4.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    Ipv6Metric {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Type: <b>IF_LUID</b>
     * 
     * The interface LUID for the adapter address.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {NET_LUID_LH}
     */
    Luid{
        get {
            if(!this.HasProp("__Luid"))
                this.__Luid := NET_LUID_LH(this.ptr + 224)
            return this.__Luid
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a></b>
     * 
     * The IPv4 address of the DHCP server for the adapter address. This member is only applicable to an IPv4 
     *       adapter address configured using DHCP.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {SOCKET_ADDRESS}
     */
    Dhcpv4Server{
        get {
            if(!this.HasProp("__Dhcpv4Server"))
                this.__Dhcpv4Server := SOCKET_ADDRESS(this.ptr + 240)
            return this.__Dhcpv4Server
        }
    }

    /**
     * Type: <b>NET_IF_COMPARTMENT_ID</b>
     * 
     * The routing compartment ID for the adapter address.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later. This member is not 
     *        currently supported and is reserved for future use.</div>
     * <div> </div>
     * @type {Integer}
     */
    CompartmentId {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * Type: <b>NET_IF_NETWORK_GUID</b>
     * 
     * The <b>GUID</b> that is associated with the network that the interface belongs to. 
     * 
     * If 
     *       the interface provider cannot provide the network GUID, this member can be a zero <b>GUID</b>.
     *       In this case, the interface was registered by NDIS in the default network.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Pointer<Guid>}
     */
    NetworkGuid {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Type: <b>NET_IF_CONNECTION_TYPE</b>
     * 
     * The interface connection type for the adapter address.
     *       
     * 
     * This member can be one of the values from the <b>NET_IF_CONNECTION_TYPE</b> enumeration 
     *        type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_DEDICATED"></a><a id="net_if_connection_dedicated"></a><dl>
     * <dt><b>NET_IF_CONNECTION_DEDICATED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is dedicated. The connection comes up automatically when media sense is <b>TRUE</b>. For 
     *         example, an Ethernet connection is dedicated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_PASSIVE"></a><a id="net_if_connection_passive"></a><dl>
     * <dt><b>NET_IF_CONNECTION_PASSIVE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is passive. The remote end must bring up the connection to the local station. For 
     *         example, a RAS interface is passive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_DEMAND"></a><a id="net_if_connection_demand"></a><dl>
     * <dt><b>NET_IF_CONNECTION_DEMAND</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is demand-dial. A connection of this type comes up in response to a local action 
     *         (sending a packet, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_MAXIMUM"></a><a id="net_if_connection_maximum"></a><dl>
     * <dt><b>NET_IF_CONNECTION_MAXIMUM</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum possible value for the <b>NET_IF_CONNECTION_TYPE</b> enumeration type. 
     *         This is not a legal value for <b>ConnectionType</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    ConnectionType {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * Type: <b>TUNNEL_TYPE</b>
     * 
     * The encapsulation method used by a tunnel if the adapter address is a tunnel.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * The tunnel type is defined by the Internet Assigned Names Authority (IANA). For more information, see 
     *       <a href="https://www.iana.org/assignments/ianaiftype-mib">http://www.iana.org/assignments/ianaiftype-mib</a>. 
     *       This member can be one of the values from the <b>TUNNEL_TYPE</b> enumeration type defined 
     *       in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_NONE"></a><a id="tunnel_type_none"></a><dl>
     * <dt><b>TUNNEL_TYPE_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not a tunnel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_OTHER"></a><a id="tunnel_type_other"></a><dl>
     * <dt><b>TUNNEL_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the following tunnel types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_DIRECT"></a><a id="tunnel_type_direct"></a><dl>
     * <dt><b>TUNNEL_TYPE_DIRECT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A packet is encapsulated directly within a normal IP header, with no intermediate header, and unicast to 
     *         the remote tunnel endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_6TO4"></a><a id="tunnel_type_6to4"></a><dl>
     * <dt><b>TUNNEL_TYPE_6TO4</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IPv6 packet is encapsulated directly within an IPv4 header, with no intermediate header, and unicast 
     *         to the destination determined by the 6to4 protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_ISATAP"></a><a id="tunnel_type_isatap"></a><dl>
     * <dt><b>TUNNEL_TYPE_ISATAP</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IPv6 packet is encapsulated directly within an IPv4 header, with no intermediate header, and unicast 
     *         to the destination determined by the ISATAP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_TEREDO"></a><a id="tunnel_type_teredo"></a><dl>
     * <dt><b>TUNNEL_TYPE_TEREDO</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Teredo encapsulation for IPv6 packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_IPHTTPS"></a><a id="tunnel_type_iphttps"></a><dl>
     * <dt><b>TUNNEL_TYPE_IPHTTPS</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IP over HTTPS encapsulation for IPv6 packets.
     * 
     * <div class="alert"><b>Note</b>  This enumeration value is only available on Windows 7,  Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TunnelType {
        get => NumGet(this, 276, "int")
        set => NumPut("int", value, this, 276)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a></b>
     * 
     * The IPv6 address of the DHCPv6 server for the adapter address. This member is only applicable to an IPv6 
     *       adapter address configured using DHCPv6. This structure member is not currently supported and is reserved for future use.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {SOCKET_ADDRESS}
     */
    Dhcpv6Server{
        get {
            if(!this.HasProp("__Dhcpv6Server"))
                this.__Dhcpv6Server := SOCKET_ADDRESS(this.ptr + 280)
            return this.__Dhcpv6Server
        }
    }

    /**
     * Type: <b>BYTE[MAX_DHCPV6_DUID_LENGTH]</b>
     * 
     * The DHCP unique identifier (DUID) for the DHCPv6 client. This member is only applicable to an IPv6 adapter 
     *       address configured using DHCPv6.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Array<Byte>}
     */
    Dhcpv6ClientDuid{
        get {
            if(!this.HasProp("__Dhcpv6ClientDuidProxyArray"))
                this.__Dhcpv6ClientDuidProxyArray := Win32FixedArray(this.ptr + 296, 130, Primitive, "char")
            return this.__Dhcpv6ClientDuidProxyArray
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The length, in bytes, of the DHCP unique identifier (DUID) for the DHCPv6 client. This member is only 
     *       applicable to an IPv6 adapter address configured using DHCPv6.
     *       
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    Dhcpv6ClientDuidLength {
        get => NumGet(this, 428, "uint")
        set => NumPut("uint", value, this, 428)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The identifier for an identity association chosen by the DHCPv6 client. This member is only applicable to 
     *       an IPv6 adapter address configured using DHCPv6.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer}
     */
    Dhcpv6Iaid {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * Type: <b>PIP_ADAPTER_DNS_SUFFIX</b>
     * 
     * A pointer to the first <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_dns_suffix">IP_ADAPTER_DNS_SUFFIX</a> structure in a linked list of 
     *       DNS suffixes for the adapter.
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista with SP1and later and on Windows Server 2008  and later.</div>
     * <div> </div>
     * @type {Pointer<IP_ADAPTER_DNS_SUFFIX>}
     */
    FirstDnsSuffix {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }
}
