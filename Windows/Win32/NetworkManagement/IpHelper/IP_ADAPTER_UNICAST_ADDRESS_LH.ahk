#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\NL_PREFIX_ORIGIN.ahk" { NL_PREFIX_ORIGIN }
#Import "..\..\Networking\WinSock\NL_SUFFIX_ORIGIN.ahk" { NL_SUFFIX_ORIGIN }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Networking\WinSock\NL_DAD_STATE.ahk" { NL_DAD_STATE }
#Import "..\..\Networking\WinSock\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }

/**
 * The IP_ADAPTER_UNICAST_ADDRESS_LH structure (iptypes.h) stores a single unicast IP address in a linked list of IP addresses for a particular adapter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function. The <b>FirstUnicastAddress</b> member of the <b>IP_ADAPTER_ADDRESSES</b> structure is a pointer to a linked list of <b>IP_ADAPTER_UNICAST_ADDRESS</b> structures. 
 * 
 * The size of the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure changed on Windows Vista and later. The <b>Length</b> member should be used to determine which version of the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure is being used. 
 * 
 * The version of the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure on Windows Vista and later has the following new member added: <b>OnLinkPrefixLength</b>.
 * 
 * When this structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function and similar management functions, all configured addresses are shown, including duplicate addresses. Such duplicate address entries can occur when addresses are configured statically. Such reporting facilitates administrator troubleshooting. The <b>DadState</b> member is effective in identifying and troubleshooting such situations.
 * 
 * In the Windows SDK, the version of the structure for use on Windows Vista and later is  defined as <b>IP_ADAPTER_UNICAST_ADDRESS_LH</b>. In the Windows SDK, the version of this structure to be used on earlier systems including Windows XP with Service Pack 1 (SP1) and later is defined as <b>IP_ADAPTER_UNICAST_ADDRESS_XP</b>. When compiling an application if the target platform is Windows Vista and later (<c>NTDDI_VERSION &gt;= NTDDI_VISTA</code>, <code>_WIN32_WINNT &gt;= 0x0600</code>, or <code>WINVER &gt;= 0x0600</c>), the <b>IP_ADAPTER_UNICAST_ADDRESS_LH</b> structure is typedefed to the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure. When compiling an application if the target platform is not Windows Vista and later, the <b>IP_ADAPTER_UNICAST_ADDRESS_XP</b> structure is typedefed to the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure is used in the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure. On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>SOCKET_ADDRESS</b> structure is defined in the <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. On the Platform Software Development Kit (SDK) released for Windows Server 2003 and Windows XP, the <b>SOCKET_ADDRESS</b> structure is declared in the <i>Winsock2.h</i> header file. In order to use the <b>IP_ADAPTER_UNICAST_ADDRESS</b> structure, the <i>Winsock2.h</i> header file must be included before the <i>Iphlpapi.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_ADAPTER_UNICAST_ADDRESS_LH {
    #StructPack 8

    Alignment : Int64

    /**
     * Type: <b>struct _IP_ADAPTER_UNICAST_ADDRESS*</b>
     * 
     * A pointer to the next IP adapter address structure in the list.
     */
    Next : IP_ADAPTER_UNICAST_ADDRESS_LH.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a></b>
     * 
     * The IP address for this unicast IP address entry. This member can be an IPv6 address or an IPv4 address.
     */
    Address : SOCKET_ADDRESS

    /**
     * Type: <b>IP_PREFIX_ORIGIN</b>
     * 
     * The prefix or network part of IP the address. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/nldef/ne-nldef-nl_prefix_origin">IP_PREFIX_ORIGIN</a> enumeration type defined in the <i>Iptypes.h</i> header file.
     */
    PrefixOrigin : NL_PREFIX_ORIGIN

    /**
     * Type: <b>IP_SUFFIX_ORIGIN</b>
     * 
     * The suffix or host part of the IP address. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/nldef/ne-nldef-nl_suffix_origin">IP_SUFFIX_ORIGIN</a> enumeration type defined in the <i>Iptypes.h</i> header file.
     */
    SuffixOrigin : NL_SUFFIX_ORIGIN

    /**
     * Type: <b>IP_DAD_STATE</b>
     * 
     * The duplicate address detection (DAD) state. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/nldef/ne-nldef-nl_dad_state">IP_DAD_STATE</a> enumeration type defined in the <i>Iptypes.h</i> header file. 
     * Duplicate address detection is available for both IPv4 and IPv6 addresses.
     */
    DadState : NL_DAD_STATE

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum lifetime, in seconds, that the IP address is valid. A value of 0xffffffff is considered to be infinite.
     */
    ValidLifetime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The preferred lifetime, in seconds, that the IP address is valid. A value of 0xffffffff is considered to be infinite.
     */
    PreferredLifetime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The lease lifetime, in seconds, that the IP address is valid.
     */
    LeaseLifetime : UInt32

    /**
     * Type: <b>UINT8</b>
     * 
     * The length, in bits, of the prefix or network part of the IP address. For a unicast IPv4 address, any value greater than 32 is an illegal value. For a unicast IPv6 address, any value greater than 128 is an illegal value. 
     * A value of 255 is commonly used to represent an illegal value. 
     * 
     * <div class="alert"><b>Note</b>  This structure member is only available on Windows Vista and later.</div>
     * <div> </div>
     */
    OnLinkPrefixLength : Int8

    static __New() {
        DefineProp(this.Prototype, 'Length', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
