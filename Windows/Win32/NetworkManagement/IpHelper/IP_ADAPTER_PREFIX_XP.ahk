#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Networking\WinSock\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }

/**
 * Stores an IP address prefix.I
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function. On Windows XP with Service Pack 1 (SP1) and later, the <b>FirstPrefix</b> member of the <b>IP_ADAPTER_ADDRESSES</b> structure is a pointer to a linked list of <b>IP_ADAPTER_PREFIX</b> structures. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure is used in the <b>IP_ADAPTER_PREFIX</b> structure. On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>SOCKET_ADDRESS</b> structure is defined in the <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. On the Platform Software Development Kit (SDK) released for Windows Server 2003 and Windows XP, the <b>SOCKET_ADDRESS</b> structure is declared in the <i>Winsock2.h</i> header file. In order to use the <b>IP_ADAPTER_PREFIX</b> structure, the <i>Winsock2.h</i> header file must be included before the <i>Iphlpapi.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_prefix_xp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_ADAPTER_PREFIX_XP {
    #StructPack 8

    Alignment : Int64

    /**
     * A pointer to the next adapter prefix structure in the list.
     */
    Next : IP_ADAPTER_PREFIX_XP.Ptr

    /**
     * The address prefix, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure.
     */
    Address : SOCKET_ADDRESS

    /**
     * The length of the prefix, in bits.
     */
    PrefixLength : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Length', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
