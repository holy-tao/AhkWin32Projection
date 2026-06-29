#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNAL_IF_OPER_STATUS.ahk" { INTERNAL_IF_OPER_STATUS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Stores information about a particular interface. (MIB_IFROW)
 * @remarks
 * The <b>dwSpeed</b> member of the <b>MIB_IFROW</b> structure will be incorrect for very high-speed network interfaces (10 Gbit/s network adapter, for example) since the maximum value that can be store in a DWORD is 4,294,967,295. Applications should use the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getifentry2">GetIfEntry2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> functions or the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function for determining the speed for very high-speed network interfaces.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IFROW</b> structure is defined in the <i>Ifmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ifmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ifmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ifmib/ns-ifmib-mib_ifrow
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IFROW {
    #StructPack 4

    /**
     * Type: <b>WCHAR[MAX_INTERFACE_NAME_LEN]</b>
     * 
     * A pointer to a Unicode string that contains the name of the interface.
     */
    wszName : WCHAR[256]

    /**
     * Type: <b>DWORD</b>
     * 
     * The index that identifies the interface. This index value may change when a network adapter is disabled and then enabled, and should not be considered persistent.
     */
    dwIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The interface type as defined by the Internet Assigned Names Authority (IANA). For more information, see <a href="https://www.iana.org/assignments/ianaiftype-mib">http://www.iana.org/assignments/ianaiftype-mib</a>. Possible values for the interface type are listed in the <i>Ipifcons.h</i> header file. 
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
     * <td width="40%"><a id="IF_TYPE_FDDI"></a><a id="if_type_fddi"></a><dl>
     * <dt><b>IF_TYPE_FDDI</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Fiber Distributed Data Interface (FDDI) network interface.
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
     * <tr>
     * <td width="40%"><a id="_IF_TYPE_IEEE80216_WMAN"></a><a id="_if_type_ieee80216_wman"></a><dl>
     * <dt><b> IF_TYPE_IEEE80216_WMAN</b></dt>
     * <dt>237</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mobile broadband interface for WiMax devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_WWANPP"></a><a id="if_type_wwanpp"></a><dl>
     * <dt><b>IF_TYPE_WWANPP</b></dt>
     * <dt>243</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mobile broadband interface for GSM-based devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_WWANPP2"></a><a id="if_type_wwanpp2"></a><dl>
     * <dt><b>IF_TYPE_WWANPP2</b></dt>
     * <dt>244</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An mobile broadband interface for CDMA-based devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     */
    dwType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The Maximum Transmission Unit (MTU) size in bytes.
     */
    dwMtu : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The speed of the interface in bits per second.
     */
    dwSpeed : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the physical address specified by the <b>bPhysAddr</b> member.
     */
    dwPhysAddrLen : UInt32

    /**
     * Type: <b>BYTE[MAXLEN_PHYSADDR]</b>
     * 
     * The physical address of the adapter for this interface.
     */
    bPhysAddr : Int8[8]

    /**
     * Type: <b>DWORD</b>
     * 
     * The interface is administratively enabled or disabled.
     */
    dwAdminStatus : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwOperStatus : INTERNAL_IF_OPER_STATUS

    /**
     * Type: <b>DWORD</b>
     * 
     * The  length of time, in hundredths of seconds (10^-2 sec), starting from the last computer restart, when the interface entered its current operational state. This value rolls over after 2^32 hundredths of a second. 
     * 
     * The <b>dwLastChange</b> member is not currently supported by NDIS. On Windows Vista and later, NDIS returns zero for this member. On earlier versions of Windows, an arbitrary value is returned in this member for the interfaces supported by NDIS. For interfaces supported by other interface providers, they might return an appropriate value.
     */
    dwLastChange : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of octets of data received through this interface.
     */
    dwInOctets : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of unicast packets received through this interface.
     */
    dwInUcastPkts : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of non-unicast packets received through this interface. Broadcast and multicast packets are included.
     */
    dwInNUcastPkts : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of incoming packets that were discarded even though they did not have errors.
     */
    dwInDiscards : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of incoming packets that were discarded because of errors.
     */
    dwInErrors : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of incoming packets that were discarded because the protocol was unknown.
     */
    dwInUnknownProtos : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of octets of data sent through this interface.
     */
    dwOutOctets : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of unicast packets sent through this interface.
     */
    dwOutUcastPkts : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of non-unicast packets sent through this interface. Broadcast and multicast packets are included.
     */
    dwOutNUcastPkts : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing packets that were discarded even though they did not have errors.
     */
    dwOutDiscards : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing packets that were discarded because of errors.
     */
    dwOutErrors : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The transmit queue length. This field is not currently used.
     */
    dwOutQLen : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the <b>bDescr</b> member.
     */
    dwDescrLen : UInt32

    /**
     * Type: <b>BYTE[MAXLEN_IFDESCR]</b>
     * 
     * A description of the interface.
     */
    bDescr : Int8[256]

}
