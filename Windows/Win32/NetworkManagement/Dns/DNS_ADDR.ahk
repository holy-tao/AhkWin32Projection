#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * A DNS_ADDR structure stores an IPv4 or IPv6 address.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_ADDR {
    #StructPack 2


    struct _Data {
        DnsAddrUserDword : UInt32[8]

    }

    /**
     * A value that contains the socket IP address. It is a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr_in</a> structure if the address is IPv4 and a sockaddr_in6 structure if the address is IPv6.
     */
    MaxSa : CHAR[32]

    Data : DNS_ADDR._Data

}
