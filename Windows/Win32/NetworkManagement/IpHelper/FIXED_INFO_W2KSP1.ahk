#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk
#Include .\IP_ADDR_STRING.ahk

/**
 * The FIXED_INFO structure contains information that is the same across all the interfaces on a computer.
 * @remarks
 * The 
  * <b>FIXED_INFO</b> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getnetworkparams">GetNetworkParams</a> function.
  * 
  * In the Microsoft Windows Software Development Kit (SDK), the <b>FIXED_INFO_WIN2KSP1</b> structure is defined.   When compiling an 
  *      application if the target platform is Windows 2000 with Service Pack 1 (SP1) and later (<c>NTDDI_VERSION &gt;= NTDDI_WIN2KSP1</c>, 
  *      <c>_WIN32_WINNT &gt;= 0x0501</c>, or 
  *      <c>WINVER &gt;= 0x0501</c>), the <b>FIXED_INFO_WIN2KSP1</b> struct is typedefed to the <b>FIXED_INFO</b> structure. When compiling an application if the target 
  *      platform is not Windows 2000 with SP1 and later, the 
  *      <b>FIXED_INFO</b> structure is undefined.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getnetworkparams">GetNetworkParams</a> function and the 
  *      <b>FIXED_INFO</b> structure are supported on  Windows 98and later. But to build an application for a target platform earlier than Windows 2000 with Service Pack 1 (SP1), an earlier version of the Platform Software Development Kit (SDK)  must be used.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-fixed_info_w2ksp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class FIXED_INFO_W2KSP1 extends Win32Struct
{
    static sizeof => 600

    static packingSize => 8

    /**
     * Type: <b>char[MAX_HOSTNAME_LEN + 4]</b>
     * 
     * The hostname for the local computer. This may be the fully qualified hostname (including the domain) for a computer that is joined to a domain.
     * @type {Array<SByte>}
     */
    HostName{
        get {
            if(!this.HasProp("__HostNameProxyArray"))
                this.__HostNameProxyArray := Win32FixedArray(this.ptr + 0, 132, Primitive, "char")
            return this.__HostNameProxyArray
        }
    }

    /**
     * Type: <b>char[MAX_DOMAIN_NAME_LEN + 4]</b>
     * 
     * The domain in which the local computer is registered.
     * @type {Array<SByte>}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainNameProxyArray"))
                this.__DomainNameProxyArray := Win32FixedArray(this.ptr + 132, 132, Primitive, "char")
            return this.__DomainNameProxyArray
        }
    }

    /**
     * Type: <b>PIP_ADDR_STRING</b>
     * 
     * Reserved. Use the <b>DnsServerList</b> member to obtain the DNS servers for the local computer.
     * @type {Pointer<IP_ADDR_STRING>}
     */
    CurrentDnsServer {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Type: <b>IP_ADDR_STRING</b>
     * 
     * A linked list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_addr_string">IP_ADDR_STRING</a> structures that specify the set of DNS servers used by the local computer.
     * @type {IP_ADDR_STRING}
     */
    DnsServerList{
        get {
            if(!this.HasProp("__DnsServerList"))
                this.__DnsServerList := IP_ADDR_STRING(this.ptr + 272)
            return this.__DnsServerList
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The node type of the local computer. These values are defined in the 
     *       <i>Iptypes.h</i> header file.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>NodeType</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BROADCAST_NODETYPE"></a><a id="broadcast_nodetype"></a><dl>
     * <dt><b>BROADCAST_NODETYPE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A broadcast nodetype.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_TO_PEER_NODETYPE"></a><a id="peer_to_peer_nodetype"></a><dl>
     * <dt><b>PEER_TO_PEER_NODETYPE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A peer to peer nodetype.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXED_NODETYPE"></a><a id="mixed_nodetype"></a><dl>
     * <dt><b>MIXED_NODETYPE</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mixed nodetype.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HYBRID_NODETYPE"></a><a id="hybrid_nodetype"></a><dl>
     * <dt><b>HYBRID_NODETYPE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A hybrid nodetype.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    NodeType {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * Type: <b>char[MAX_SCOPE_ID_LEN + 4]</b>
     * 
     * The DHCP scope name.
     * @type {Array<SByte>}
     */
    ScopeId{
        get {
            if(!this.HasProp("__ScopeIdProxyArray"))
                this.__ScopeIdProxyArray := Win32FixedArray(this.ptr + 324, 260, Primitive, "char")
            return this.__ScopeIdProxyArray
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * A Boolean value that specifies whether routing is enabled on the local computer.
     * @type {Integer}
     */
    EnableRouting {
        get => NumGet(this, 584, "uint")
        set => NumPut("uint", value, this, 584)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * A Boolean value that specifies whether the local computer is acting as an ARP proxy.
     * @type {Integer}
     */
    EnableProxy {
        get => NumGet(this, 588, "uint")
        set => NumPut("uint", value, this, 588)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * A Boolean value that specifies whether DNS is enabled on the local computer.
     * @type {Integer}
     */
    EnableDns {
        get => NumGet(this, 592, "uint")
        set => NumPut("uint", value, this, 592)
    }
}
