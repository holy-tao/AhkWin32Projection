#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk
#Include .\IP_ADDR_STRING.ahk

/**
 * Contains information about a particular network adapter on the local computer.
 * @remarks
 * The 
  * <b>IP_ADAPTER_INFO</b> structure is limited to IPv4 information about a particular network adapter on the local computer. The 
  * <b>IP_ADAPTER_INFO</b> structure is retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> function.
  * 
  * When using Visual Studio 2005 and later, the <b>time_t</b> datatype defaults to an 8-byte datatype, not the 4-byte datatype used for the <b>LeaseObtained</b> and <b>LeaseExpires</b> members on a 32-bit platform. To properly use the <b>IP_ADAPTER_INFO</b> structure on a 32-bit platform, define <b>_USE_32BIT_TIME_T</b> (use <c>-D _USE_32BIT_TIME_T</c> as an option, for example) when compiling the application to force the <b>time_t</b> datatype to a 4-byte datatype.
  * 
  * For use on Windows XP and later, the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure contains both IPv4 and IPv6 information. The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function retrieves IPv4 and IPv6 adapter information.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_INFO extends Win32Struct
{
    static sizeof => 1256

    static packingSize => 8

    /**
     * Type: <b>struct _IP_ADAPTER_INFO*</b>
     * 
     * A pointer to the next adapter in the list of adapters.
     * @type {Pointer<IP_ADAPTER_INFO>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    ComboIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>char[MAX_ADAPTER_NAME_LENGTH + 4]</b>
     * 
     * An ANSI character string of the name of the adapter.
     * @type {String}
     */
    AdapterName {
        get => StrGet(this.ptr + 12, 259, "UTF-16")
        set => StrPut(value, this.ptr + 12, 259, "UTF-16")
    }

    /**
     * Type: <b>char[MAX_ADAPTER_DESCRIPTION_LENGTH + 4]</b>
     * 
     * An ANSI character string that contains the description of the adapter.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 532, 131, "UTF-16")
        set => StrPut(value, this.ptr + 532, 131, "UTF-16")
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The length, in bytes,  of the hardware address for the adapter.
     * @type {Integer}
     */
    AddressLength {
        get => NumGet(this, 796, "uint")
        set => NumPut("uint", value, this, 796)
    }

    /**
     * Type: <b>BYTE[MAX_ADAPTER_ADDRESS_LENGTH]</b>
     * 
     * The hardware address for the adapter represented as a <b>BYTE</b> array.
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 800, 8, Primitive, "char")
            return this.__AddressProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The adapter index. 
     * 
     * The adapter index  may change when an adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 808, "uint")
        set => NumPut("uint", value, this, 808)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The adapter type. Possible values for the adapter type are listed in the <i>Ipifcons.h</i> header file.
     * 
     * 
     * The table below lists common values for the adapter type although other values are possible on Windows Vista and later. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IF_TYPE_OTHER"></a><a id="mib_if_type_other"></a><dl>
     * <dt><b>MIB_IF_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some other type of network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IF_TYPE_ETHERNET"></a><a id="mib_if_type_ethernet"></a><dl>
     * <dt><b>MIB_IF_TYPE_ETHERNET</b></dt>
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
     * MIB_IF_TYPE_TOKENRING
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IF_TYPE_PPP"></a><a id="mib_if_type_ppp"></a><dl>
     * <dt><b>MIB_IF_TYPE_PPP</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A PPP network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IF_TYPE_LOOPBACK"></a><a id="mib_if_type_loopback"></a><dl>
     * <dt><b>MIB_IF_TYPE_LOOPBACK</b></dt>
     * <dt>24</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A software loopback network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IF_TYPE_SLIP"></a><a id="mib_if_type_slip"></a><dl>
     * <dt><b>MIB_IF_TYPE_SLIP</b></dt>
     * <dt>28</dt>
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
     * <div class="alert"><b>Note</b>  This adapter type is returned on Windows Vista and later.  On Windows Server 2003 and Windows XP , an IEEE 802.11 wireless network interface returns an adapter type of  <b>MIB_IF_TYPE_ETHERNET</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 812, "uint")
        set => NumPut("uint", value, this, 812)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * An option value  that specifies whether the dynamic host configuration protocol (DHCP) is enabled for this adapter.
     * @type {Integer}
     */
    DhcpEnabled {
        get => NumGet(this, 816, "uint")
        set => NumPut("uint", value, this, 816)
    }

    /**
     * Type: <b>PIP_ADDR_STRING</b>
     * 
     * Reserved.
     * @type {Pointer<IP_ADDR_STRING>}
     */
    CurrentIpAddress {
        get => NumGet(this, 824, "ptr")
        set => NumPut("ptr", value, this, 824)
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * The list of IPv4 addresses associated with this adapter represented as  a linked list of <b>IP_ADDR_STRING</b> structures. An adapter can have multiple IPv4 addresses assigned to it.
     * @type {IP_ADDR_STRING}
     */
    IpAddressList{
        get {
            if(!this.HasProp("__IpAddressList"))
                this.__IpAddressList := IP_ADDR_STRING(this.ptr + 832)
            return this.__IpAddressList
        }
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * The IPv4 address of the gateway for this adapter represented as  a linked list of <b>IP_ADDR_STRING</b> structures. An adapter can have multiple IPv4 gateway addresses assigned to it. This list usually contains a single entry for IPv4 address of the default gateway for this adapter.
     * @type {IP_ADDR_STRING}
     */
    GatewayList{
        get {
            if(!this.HasProp("__GatewayList"))
                this.__GatewayList := IP_ADDR_STRING(this.ptr + 912)
            return this.__GatewayList
        }
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * The IPv4 address of the DHCP server for this adapter represented as  a linked list of <b>IP_ADDR_STRING</b> structures. This  list contains a single entry for the IPv4 address of the DHCP server for this adapter. A value of 255.255.255.255 indicates the DHCP server could not be reached, or is in the process of being reached. 
     * 
     * This member is only valid when the <b>DhcpEnabled</b> member is nonzero.
     * @type {IP_ADDR_STRING}
     */
    DhcpServer{
        get {
            if(!this.HasProp("__DhcpServer"))
                this.__DhcpServer := IP_ADDR_STRING(this.ptr + 992)
            return this.__DhcpServer
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * An option value that specifies whether this adapter uses the Windows Internet Name Service (WINS).
     * @type {Integer}
     */
    HaveWins {
        get => NumGet(this, 1072, "int")
        set => NumPut("int", value, this, 1072)
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * The IPv4 address of the primary WINS server represented as  a linked list of <b>IP_ADDR_STRING</b> structures. This list contains a single entry for the IPv4 address of the primary WINS server for this adapter. 
     * 
     * This member is only valid when the <b>HaveWins</b> member is <b>TRUE</b>.
     * @type {IP_ADDR_STRING}
     */
    PrimaryWinsServer{
        get {
            if(!this.HasProp("__PrimaryWinsServer"))
                this.__PrimaryWinsServer := IP_ADDR_STRING(this.ptr + 1080)
            return this.__PrimaryWinsServer
        }
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * The IPv4 address of the secondary WINS server represented as  a linked list of <b>IP_ADDR_STRING</b> structures. An adapter can have multiple secondary WINS server addresses assigned to it. 
     * 
     * This member is only valid when the <b>HaveWins</b> member is <b>TRUE</b>.
     * @type {IP_ADDR_STRING}
     */
    SecondaryWinsServer{
        get {
            if(!this.HasProp("__SecondaryWinsServer"))
                this.__SecondaryWinsServer := IP_ADDR_STRING(this.ptr + 1160)
            return this.__SecondaryWinsServer
        }
    }

    /**
     * Type: <b>time_t</b>
     * 
     * The time when the current DHCP lease was obtained. 
     * 
     * This member is only valid when the <b>DhcpEnabled</b> member is nonzero.
     * @type {Integer}
     */
    LeaseObtained {
        get => NumGet(this, 1240, "int64")
        set => NumPut("int64", value, this, 1240)
    }

    /**
     * Type: <b>time_t</b>
     * 
     * The time when the current DHCP lease expires. 
     * 
     * This member is only valid when the <b>DhcpEnabled</b> member is nonzero.
     * @type {Integer}
     */
    LeaseExpires {
        get => NumGet(this, 1248, "int64")
        set => NumPut("int64", value, this, 1248)
    }
}
