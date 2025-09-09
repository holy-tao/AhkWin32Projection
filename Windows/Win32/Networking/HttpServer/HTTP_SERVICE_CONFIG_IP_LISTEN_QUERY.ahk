#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk

/**
 * Used by HttpQueryServiceConfiguration to return a list of the Internet Protocol (IP) addresses to which the HTTP service binds.
 * @remarks
 * An IPv4 address may be expressed as a literal string of four dotted decimal numbers, each in the range 0-255, such as 192.168.197.113. IPv4 addresses are contained in <b>sockaddr_in</b> structures, declared in the Windows header file Winsock2.h as follows:
  * 
  * 
  * ``` syntax
  *   struct sockaddr_in {
  *     short    sin_family;        // == AF_INET 
  *     u_short  sin_port;          // Transport-level port number 
  *     struct   in_addr sin_addr;  // IPv4 address 
  *     char     sin_zero[8];
  *   };
  * 
  * ```
  * 
  * The <b>SOCKADDR_IN</b> structure is exactly equivalent to <b>sockaddr_in</b> by typedef.
  * 
  * An IPv6 address can be expressed as a literal string enclosed in square brackets that contains hex numbers separated by colons; examples are: [::1] and [3ffe:ffff:6ECB:0101]. IPv6 addresses are contained in <b>sockaddr_in6</b> structures, declared in the Windows header file WS2tcpip.h as follows:
  * 
  * 
  * ``` syntax
  *   struct sockaddr_in6 {
  *     short    sin6_family;       // == AF_INET6 
  *     u_short  sin6_port;         // Transport-level port number 
  *     u_long   sin6_flowinfo;     // IPv6 flow information 
  *     IN6_ADDR sin6_addr;         // IPv6 address 
  *     u_long   sin6_scope_id;     // set of scope interfaces 
  *   };
  * 
  * ```
  * 
  * The <b>SOCKADDR_IN6</b> structure is exactly equivalent to <b>sockaddr_in6</b> by typedef.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ip_listen_query
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of address structures in the <b>AddrList</b> array.
     * @type {Integer}
     */
    AddrCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structures that contains IP addresses in either IPv4 or IPv6 form. To determine what form an address in the list has, cast it to a SOCKADDR and examine the <b>sa_family</b> element. If <b>sa_family</b> is equal to AF_INET, the address is in IPv4 form, or if it is equal to AF_INET6, the address is in IPv6 form.
     * @type {Array<SOCKADDR_STORAGE>}
     */
    AddrList{
        get {
            if(!this.HasProp("__AddrListProxyArray"))
                this.__AddrListProxyArray := Win32FixedArray(this.ptr + 8, 1, SOCKADDR_STORAGE, "")
            return this.__AddrListProxyArray
        }
    }
}
