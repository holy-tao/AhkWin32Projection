#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a custom Domain Name System (DNS) server, used in the Winsock APIs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfo_dns_server
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ADDRINFO_DNS_SERVER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ai_servertype {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitmap containing any of the following options.
     * 
     * | Constant | Value | Meaning |
     * |-|-|-|
     * | **AI_DNS_SERVER_UDP_FALLBACK** | 0x1 | This server can also be used for non-secure name resolution. |
     * @type {Integer}
     */
    ai_flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The length in bytes of the socket address structure that *ai_addr* points to.
     * @type {Integer}
     */
    ai_addrlen {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a socket address structure containing the address of the custom server. Only **SOCKADDR_IN** and **SOCKADDR_IN6** structures are supported. The *sa_family* member must be set to **AF_INET** or **AF_INET6**. The rest of the structure must be zeroed out, with the exception of the **SOCKADDR_IN::sin_addr** member for IPv4, or **SOCKADDR_IN6::sin6_addr** for IPv6.
     * @type {Pointer<SOCKADDR>}
     */
    ai_addr {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Anonymous {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
