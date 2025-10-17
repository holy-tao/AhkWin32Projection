#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk
#Include .\SOCKADDR_IN.ahk
#Include .\IN6_ADDR.ahk
#Include .\SCOPE_ID.ahk
#Include .\SOCKADDR_IN6.ahk

/**
 * Contains an IPv4, an IPv6 address, or an address family.
 * @remarks
 * 
  * The <b>SOCKADDR_INET</b> union is defined on Windows Vista and later. 
  * 
  * The <b>SOCKADDR_INET</b> union is a convenience structure for accessing an IPv4 address, an IPv6 address, or the IP address family without having to cast  the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
  * 
  * The <b>SOCKADDR_INET</b> union is the data type of the <b>Prefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-ip_address_prefix">IP_ADDRESS_PREFIX</a> structure  
  * 
  * Note that the <i>Ws2ipdef.h</i> header file is automatically included in <i>Ws2tcpip.h</i> header file, and should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ns-ws2ipdef-sockaddr_inet
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_INET extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>SOCKADDR_IN</b>
     * 
     * An IPv4 address represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN</a> structure containing the address family and the IPv4 address. The address family is in host byte order and the IPv4 address is  in network byte order.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN</a> structure is defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * @type {SOCKADDR_IN}
     */
    Ipv4{
        get {
            if(!this.HasProp("__Ipv4"))
                this.__Ipv4 := SOCKADDR_IN(0, this)
            return this.__Ipv4
        }
    }

    /**
     * Type: <b>SOCKADDR_IN6</b>
     * 
     * An IPv6 address represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structure containing the address family and the IPv6 address. The address family is in host byte order and the IPv6 address is  in network byte order.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structure is defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * @type {SOCKADDR_IN6}
     */
    Ipv6{
        get {
            if(!this.HasProp("__Ipv6"))
                this.__Ipv6 := SOCKADDR_IN6(0, this)
            return this.__Ipv6
        }
    }

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family. 
     * 
     * Possible values for the address family are listed in the <i>Ws2def.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used. The <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly. 
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  the <b>SOCKADDR_INET</b> union can represent either the IPv4 or IPv6 address family. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    si_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
