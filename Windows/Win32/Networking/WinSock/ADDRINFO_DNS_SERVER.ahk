#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SOCKADDR.ahk" { SOCKADDR }

/**
 * Represents a custom Domain Name System (DNS) server, used in the Winsock APIs.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfo_dns_server
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ADDRINFO_DNS_SERVER {
    #StructPack 8

    ai_servertype : UInt32

    /**
     * A bitmap containing any of the following options.
     * 
     * | Constant | Value | Meaning |
     * |-|-|-|
     * | **AI_DNS_SERVER_UDP_FALLBACK** | 0x1 | This server can also be used for non-secure name resolution. |
     */
    ai_flags : Int64

    /**
     * The length in bytes of the socket address structure that *ai_addr* points to.
     */
    ai_addrlen : UInt32

    /**
     * A pointer to a socket address structure containing the address of the custom server. Only **SOCKADDR_IN** and **SOCKADDR_IN6** structures are supported. The *sa_family* member must be set to **AF_INET** or **AF_INET6**. The rest of the structure must be zeroed out, with the exception of the **SOCKADDR_IN::sin_addr** member for IPv4, or **SOCKADDR_IN6::sin6_addr** for IPv6.
     */
    ai_addr : SOCKADDR.Ptr

    ai_template : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'ai_hostname', { type: PWSTR, offset: 32 })
        this.DeleteProp("__New")
    }
}
