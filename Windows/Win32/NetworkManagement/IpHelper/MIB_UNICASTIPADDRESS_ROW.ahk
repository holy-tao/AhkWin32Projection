#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Stores information about a unicast IP address.
 * @remarks
 * 
  * The <b>MIB_UNICASTIPADDRESS_ROW</b> structure is defined on Windows Vista and later. 
  * 
  * The <b>SkipAsSource</b> member of the <b>MIB_UNICASTIPADDRESS_ROW</b> structure affects the operation of the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfo">getaddrinfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfow">GetAddrInfoW</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> functions in Windows sockets. If the <i>pNodeName</i> parameter passed to the <b>getaddrinfo</b> or <b>GetAddrInfoW</b> functions or the <i>pName</i> parameter passed to the <b>GetAddrInfoEx</b> function points to a computer name, all permanent addresses for the computer that can be used as a source address are returned. On Windows Vista and later, these addresses would include all unicast IP addresses returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddresstable">GetUnicastIpAddressTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> functions in which the <b>SkipAsSource</b> member is set to false in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure. 
  * 
  * If the <i>pNodeName</i> or <i>pName</i> parameter refers to a cluster virtual server name, only virtual server addresses are returned. On Windows Vista and later, these addresses would include all unicast IP addresses returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddresstable">GetUnicastIpAddressTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> functions in which the <b>SkipAsSource</b> member is set to true in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/windows-clustering">Windows Clustering</a> for more information about clustering.
  * 
  * Windows 7 with Service Pack 1 (SP1) and Windows Server 2008 R2 with Service Pack 1 (SP1) add support to Netsh.exe for setting the SkipAsSource attribute on an IP address. This hotfix also changes the behavior such that if the <b>SkipAsSource</b> member in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure is set to false, the IP address will be registered in DNS. If the <b>SkipAsSource</b> member is set to true, the IP address is not registered in DNS.  
  * 
  * A hotfix is available for Windows 7 and Windows Server 2008 R2 that adds support to Netsh.exe for setting the SkipAsSource attribute on an IP address.  This hotfix also changes the behavior such that if the <b>SkipAsSource</b> member in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure is set to false, the IP address will be registered in DNS. If the <b>SkipAsSource</b> member is set to true, the IP address is not registered in DNS.  For more information, see Knowledge Base (KB) <a href="https://support.microsoft.com/kb/2386184">2386184</a>.   
  * 
  * A similar hotfix is also available for Windows Vista with Service Pack 2 (SP2) and Windows Server 2008 with Service Pack 2 (SP2) that adds support to Netsh.exe for setting the SkipAsSource attribute on an IP address. This hotfix also changes behavior such that if the <b>SkipAsSource</b> member in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure is set to false, the IP address will be registered in DNS. If the <b>SkipAsSource</b> member is set to true, the IP address is not registered in DNS.  For more information, see Knowledge Base (KB) <a href="https://support.microsoft.com/kb/975808">975808</a>. 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_unicastipaddress_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UNICASTIPADDRESS_ROW extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The unicast IP address. This member can be an IPv6 address or an IPv4 address.
     * @type {SOCKADDR_INET}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKADDR_INET(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * Type: <b>NET_LUID</b>
     * 
     * The locally unique identifier (LUID) for the network interface associated with this IP address.
     * @type {NET_LUID_LH}
     */
    InterfaceLuid{
        get {
            if(!this.HasProp("__InterfaceLuid"))
                this.__InterfaceLuid := NET_LUID_LH(this.ptr + 64)
            return this.__InterfaceLuid
        }
    }

    /**
     * Type: <b>NET_IFINDEX</b>
     * 
     * The local index value for the network interface associated with this IP address. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>NL_PREFIX_ORIGIN</b>
     * 
     * The origin of the prefix or network part of IP the address. This member can be one of the values from the <b>NL_PREFIX_ORIGIN</b> enumeration type defined in the <i>Nldef.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginOther"></a><a id="ipprefixoriginother"></a><a id="IPPREFIXORIGINOTHER"></a><dl>
     * <dt><b>IpPrefixOriginOther</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix was configured using a source other than those defined in this enumeration. This value is applicable to an IPv6 or IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginManual"></a><a id="ipprefixoriginmanual"></a><a id="IPPREFIXORIGINMANUAL"></a><dl>
     * <dt><b>IpPrefixOriginManual</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix was configured manually. This value is applicable to an IPv6 or IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginWellKnown"></a><a id="ipprefixoriginwellknown"></a><a id="IPPREFIXORIGINWELLKNOWN"></a><dl>
     * <dt><b>IpPrefixOriginWellKnown</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix was configured using a well-known address. This value is applicable to an IPv6 link-local address or an IPv6 loopback address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginDhcp"></a><a id="ipprefixorigindhcp"></a><a id="IPPREFIXORIGINDHCP"></a><dl>
     * <dt><b>IpPrefixOriginDhcp</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix was configured using DHCP. This value is applicable to an IPv4 address  configured using DHCP or an IPv6 address configured using DHCPv6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginRouterAdvertisement"></a><a id="ipprefixoriginrouteradvertisement"></a><a id="IPPREFIXORIGINROUTERADVERTISEMENT"></a><dl>
     * <dt><b>IpPrefixOriginRouterAdvertisement</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix was configured using router advertisement. This value is applicable to an anonymous IPv6 address that was generated after receiving a router advertisement.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpPrefixOriginUnchanged"></a><a id="ipprefixoriginunchanged"></a><a id="IPPREFIXORIGINUNCHANGED"></a><dl>
     * <dt><b>IpPrefixOriginUnchanged</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address prefix should be unchanged. This value is used when setting the properties for a unicast  IP interface when the value for the IP prefix origin should be unchanged.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PrefixOrigin {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b>NL_SUFFIX_ORIGIN</b>
     * 
     * The origin of the suffix or host part of IP the address. This member can be one of the values from the <b>NL_SUFFIX_ORIGIN</b> enumeration type defined in the <i>Nldef.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginOther"></a><a id="ipsuffixoriginother"></a><a id="IPSUFFIXORIGINOTHER"></a><dl>
     * <dt><b>IpSuffixOriginOther</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was configured using a source other than those defined in this enumeration. This value is applicable to an IPv6 or IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginManual"></a><a id="ipsuffixoriginmanual"></a><a id="IPSUFFIXORIGINMANUAL"></a><dl>
     * <dt><b>IpSuffixOriginManual</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was configured manually. This value is applicable to an IPv6 or IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginWellKnown"></a><a id="ipsuffixoriginwellknown"></a><a id="IPSUFFIXORIGINWELLKNOWN"></a><dl>
     * <dt><b>IpSuffixOriginWellKnown</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was configured using a well-known address. This value is applicable to an IPv6 link-local address or an IPv6 loopback address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginDhcp"></a><a id="ipsuffixorigindhcp"></a><a id="IPSUFFIXORIGINDHCP"></a><dl>
     * <dt><b>IpSuffixOriginDhcp</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was configured using DHCP. This value is applicable to an IPv4 address configured using DHCP or an IPv6 address configured using DHCPv6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginLinkLayerAddress"></a><a id="ipsuffixoriginlinklayeraddress"></a><a id="IPSUFFIXORIGINLINKLAYERADDRESS"></a><dl>
     * <dt><b>IpSuffixOriginLinkLayerAddress</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was the link local address. This value is applicable to an IPv6 link-local address or an IPv6 address where the network part was generated based on a router advertisement and the host part was based on the MAC hardware address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginRandom"></a><a id="ipsuffixoriginrandom"></a><a id="IPSUFFIXORIGINRANDOM"></a><dl>
     * <dt><b>IpSuffixOriginRandom</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix was generated randomly. This value is applicable to an anonymous IPv6 address where the host part of the address was generated randomly from the MAC hardware address after receiving a router advertisement.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpSuffixOriginUnchanged"></a><a id="ipsuffixoriginunchanged"></a><a id="IPSUFFIXORIGINUNCHANGED"></a><dl>
     * <dt><b>IpSuffixOriginUnchanged</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address suffix should be unchanged. This value is used when setting the properties for a unicast  IP interface when the value for the IP suffix origin should be unchanged.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SuffixOrigin {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum time, in seconds, that the IP address is valid. A value of 0xffffffff  is considered to be infinite.
     * @type {Integer}
     */
    ValidLifetime {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The preferred time, in seconds, that the IP address is valid. A value of 0xffffffff is considered to be infinite.
     * @type {Integer}
     */
    PreferredLifetime {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * The length, in bits, of the prefix or network part of the IP address. For a unicast IPv4 address, any  value greater than 32 is an illegal value. For a unicast IPv6 address, any  value greater than 128 is an illegal value. A value of 255 is commonly used to represent an illegal value.
     * @type {Integer}
     */
    OnLinkPrefixLength {
        get => NumGet(this, 100, "char")
        set => NumPut("char", value, this, 100)
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * This member specifies if the address can be used as an IP source address.
     * @type {BOOLEAN}
     */
    SkipAsSource{
        get {
            if(!this.HasProp("__SkipAsSource"))
                this.__SkipAsSource := BOOLEAN(this.ptr + 101)
            return this.__SkipAsSource
        }
    }

    /**
     * Type: <b>NL_DAD_STATE</b>
     * 
     * The duplicate Address detection (DAD) state. Duplicate address detection is applicable to both IPv6 and IPv4 addresses. This member can be one of the values from the <b>NL_DAD_STATE</b> enumeration type defined in the <i>Nldef.h</i> header file. 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateInvalid"></a><a id="ipdadstateinvalid"></a><a id="IPDADSTATEINVALID"></a><dl>
     * <dt><b>IpDadStateInvalid</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DAD state is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateTentative"></a><a id="ipdadstatetentative"></a><a id="IPDADSTATETENTATIVE"></a><dl>
     * <dt><b>IpDadStateTentative</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DAD state is tentative. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateDuplicate"></a><a id="ipdadstateduplicate"></a><a id="IPDADSTATEDUPLICATE"></a><dl>
     * <dt><b>IpDadStateDuplicate</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate IP address has been detected. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateDeprecated"></a><a id="ipdadstatedeprecated"></a><a id="IPDADSTATEDEPRECATED"></a><dl>
     * <dt><b>IpDadStateDeprecated</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address has been deprecated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStatePreferred"></a><a id="ipdadstatepreferred"></a><a id="IPDADSTATEPREFERRED"></a><dl>
     * <dt><b>IpDadStatePreferred</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address is the preferred address. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DadState {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>SCOPE_ID</b>
     * 
     * The scope ID of the IP address. This member is applicable only to an IPv6 address. This member cannot be set. It is automatically determined by the interface on which the address was added.
     * @type {SCOPE_ID}
     */
    ScopeId{
        get {
            if(!this.HasProp("__ScopeId"))
                this.__ScopeId := SCOPE_ID(this.ptr + 108)
            return this.__ScopeId
        }
    }

    /**
     * Type: <b>LARGE_INTEGER</b>
     * 
     * The time stamp when the IP address was created.
     * @type {Integer}
     */
    CreationTimeStamp {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }
}
