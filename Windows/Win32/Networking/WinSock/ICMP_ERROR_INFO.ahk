#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import ".\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\IPPROTO.ahk" { IPPROTO }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Used to store received ICMP error information.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-icmp_error_info
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMP_ERROR_INFO {
    #StructPack 4

    /**
     * Type: **[SOCKADDR_INET](./ns-ws2ipdef-sockaddr_inet.md)**
     * 
     * The source IP address of the ICMP error.
     */
    srcaddress : SOCKADDR_INET

    /**
     * Type: **IPPROTO**
     * 
     * The protocol of the ICMP error (either **IPPROTO_ICMP** or **IPPROTO_ICMPV6**).
     */
    protocol : IPPROTO

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * The ICMP error type.
     */
    type : Int8

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * The ICMP error code.
     */
    code : Int8

}
