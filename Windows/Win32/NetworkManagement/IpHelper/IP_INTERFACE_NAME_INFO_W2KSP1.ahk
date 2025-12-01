#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an IPv4 interface on the local computer.
 * @remarks
 * In the Microsoft Windows Software Development Kit (SDK), the version of the structure for use on Windows 2000 with Service Pack 1 (SP1) and later is  defined as <b>IP_INTERFACE_NAME_INFO_W2KSP1</b>. When compiling an application if the target platform is Windows 2000 with SP1 and later (<c>NTDDI_VERSION &gt;= NTDDI_WIN2KSP1</code>, <code>_WIN32_WINNT &gt;= 0x0500</code>, or <code>WINVER &gt;= 0x0500</c>), the <b>IP_INTERFACE_NAME_INFO_W2KSP1</b> structure is typedefed to the <b>IP_INTERFACE_NAME_INFO</b> structure. 
 * 
 * The <b>MediaType</b>, <b>ConnectionType</b>, and <b>AccessType</b> members, definitions and assigned values are available from the Ipifcons.h header file.
 * 
 * The optional <b>InterfaceGuid</b> member is often set for dial-up interfaces, and can be used to distinguish multiple dial-up interfaces that share  the same  device GUID.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_interface_name_info_w2ksp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_INTERFACE_NAME_INFO_W2KSP1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The index of the IP interface for the active instance.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The interface type as defined by the Internet Assigned Names Authority (IANA). Possible values for the interface type are listed in the Ipifcons.h header file. 
     * 
     * The table below lists common values for the interface type; although, many other values are possible.
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
     * An IEEE 802.11 wireless network interface. On Windows Vista and later, wireless network cards are reported as <b>IF_TYPE_IEEE80211</b>.
     * 
     * 
     * <b>Windows Server 2003, Windows 2000 Server with SP1 and Windows XP/2000:  </b>Wireless network cards are reported as <b>IF_TYPE_ETHERNET_CSMACD</b>.
     * 
     * 
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
    MediaType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * The interface connection type for the adapter. 
     * 
     * The possible values for this member are defined in the Ipifcons.h header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_CONNECTION_DEDICATED"></a><a id="if_connection_dedicated"></a><dl>
     * <dt><b>IF_CONNECTION_DEDICATED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is dedicated. The connection comes up automatically when media sense is <b>TRUE</b>. For example, an Ethernet connection is dedicated. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_CONNECTION_PASSIVE"></a><a id="if_connection_passive"></a><dl>
     * <dt><b>IF_CONNECTION_PASSIVE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is passive. The remote end must bring up the connection to the local station. For example, a RAS interface is passive. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_CONNECTION_DEMAND"></a><a id="if_connection_demand"></a><dl>
     * <dt><b>IF_CONNECTION_DEMAND</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is demand-dial. A connection of this type comes up in response to a local action (sending a packet, for example). 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ConnectionType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ne-ifdef-net_if_access_type">IF_ACCESS_TYPE</a> enumeration that specifies the access type for the interface.
     * 
     * 
     * <b>Windows Server 2003, Windows 2000 Server with SP1 and Windows XP/2000:  </b>The possible values for this member are defined in the Ipifcons.h header file.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_ACCESS_LOOPBACK"></a><a id="if_access_loopback"></a><dl>
     * <dt><b>IF_ACCESS_LOOPBACK</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The loopback access type. This value indicates that the interface loops back transmit data as receive data. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_ACCESS_BROADCAST"></a><a id="if_access_broadcast"></a><dl>
     * <dt><b>IF_ACCESS_BROADCAST</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LAN access type which includes Ethernet. This value indicates that the interface provides native support for multicast or broadcast services. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_ACCESS_POINT_TO_POINT"></a><a id="if_access_point_to_point"></a><dl>
     * <dt><b>IF_ACCESS_POINT_TO_POINT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point to point access type. This value indicates support for CoNDIS/WAN, except for non-broadcast multi-access (NBMA) interfaces.
     * 
     * 
     * <b>Windows Server 2003, Windows 2000 Server with SP1 and Windows XP/2000:  </b>This  value was defined as <b>IF_ACCESS_POINTTOPOINT</b> in the Ipifcons.h header file.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_ACCESS_POINT_TO_MULTI_POINT"></a><a id="if_access_point_to_multi_point"></a><dl>
     * <dt><b>IF_ACCESS_POINT_TO_MULTI_POINT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point to multipoint access type. This value indicates support for non-broadcast multi-access media, including the RAS internal interface and native ATM.
     * 
     * 
     * <b>Windows Server 2003, Windows 2000 Server with SP1 and Windows XP/2000:  </b>This  value was defined as <b>IF_ACCESS_POINTTOMULTIPOINT</b> in the Ipifcons.h header file.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID that identifies the underlying device for the interface. This member can be a zero GUID.
     * @type {Pointer<Guid>}
     */
    DeviceGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID that identifies the interface mapped to the device. Optional. This member can be a zero GUID.
     * @type {Pointer<Guid>}
     */
    InterfaceGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
