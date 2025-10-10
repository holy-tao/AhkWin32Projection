#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to specify an IP address to be added to or deleted from the list of IP addresses to which the HTTP service binds.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_config_ip_listen_param
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the address pointed to by <b>pAddress</b>.
     * @type {Integer}
     */
    AddrLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to an Internet Protocol (IP) address to be added to or deleted from the listen list. 
     * 
     * 
     * 
     * 
     * To specify an IPv6 address, use a <a href="https://docs.microsoft.com/previous-versions/aa915715(v=msdn.10)">SOCKADDR_IN6</a> structure, declared in the Ws2tcpip.h header file, and cast its address to a PSOCKADDR when you use it to set the <b>pAddress</b> member. The <b>sin_family</b> member of the SOCKADDR_IN6 should be set to AF_INET6.
     * 
     *   If the <b>sin_addr</b> field in <a href="https://docs.microsoft.com/previous-versions/aa915715(v=msdn.10)">SOCKADDR_IN6</a> structure is set to 0.0.0.0, it means to bind to all IPv4 addresses.
     *    If the <b>sin6_addr</b> field in <a href="https://docs.microsoft.com/previous-versions/aa915715(v=msdn.10)">SOCKADDR_IN6</a> is set to [::], it means to bind to all IPv6 addresses.
     * @type {Pointer<SOCKADDR>}
     */
    pAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
