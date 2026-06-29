#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\NET_ADDRESS_FORMAT.ahk" { NET_ADDRESS_FORMAT }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains IP address information returned by the ParseNetworkString function.
 * @remarks
 * The <b>NET_ADDRESS_INFO</b> structure is defined on Windows Vista and later. 
 * 
 * The <b>NET_ADDRESS_INFO</b> structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-parsenetworkstring">ParseNetworkString</a> function. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN</a>,  SOCKADDR_IN6, and  SOCKADDR structures are used in the <b>NET_ADDRESS_INFO</b> structure. The SOCKADDR_IN and SOCKADDR structures are defined in the  <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. The SOCKADDR_IN6 structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included by the <i>Ws2tcpip.h</i> header file. In order to use the <b>NET_ADDRESS_INFO</b> structure, the <i>Winsock2.h</i> and <i>Ws2tcpip.h</i> header files must be included before the <i>Iphlpapi.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-net_address_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct NET_ADDRESS_INFO {
    #StructPack 4


    struct _NamedAddress {
        Address : WCHAR[256]

        Port : WCHAR[6]

    }

    /**
     * Type: <b>NET_ADDRESS_FORMAT</b>
     * 
     * The format of the network address in the union in this structure. This member is an enumeration value from the [NET_ADDRESS_FORMAT](/windows/desktop/api/iphlpapi/ne-iphlpapi-net_address_format) enumeration declared in the <i>Iphlpapi.h</i> header file.
     */
    Format : NET_ADDRESS_FORMAT

    NamedAddress : NET_ADDRESS_INFO._NamedAddress

    static __New() {
        DefineProp(this.Prototype, 'Ipv4Address', { type: SOCKADDR_IN, offset: 4 })
        DefineProp(this.Prototype, 'Ipv6Address', { type: SOCKADDR_IN6, offset: 4 })
        DefineProp(this.Prototype, 'IpAddress', { type: SOCKADDR, offset: 4 })
        this.DeleteProp("__New")
    }
}
