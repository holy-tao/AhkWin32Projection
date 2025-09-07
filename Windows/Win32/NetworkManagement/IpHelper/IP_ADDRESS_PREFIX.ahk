#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk

/**
 * Stores an IP address prefix. (IP_ADDRESS_PREFIX)
 * @remarks
 * The <b>IP_ADDRESS_PREFIX</b> structure is defined on Windows Vista and later. 
  * 
  * The <b>IP_ADDRESS_PREFIX</b> structure is the data type of the <b>DestinationPrefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure.  A number of functions use the <b>MIB_IPFORWARD_ROW2</b> structure including <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createipforwardentry2">CreateIpForwardEntry2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-deleteipforwardentry2">DeleteIpForwardEntry2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getbestroute2">GetBestRoute2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardentry2">GetIpForwardEntry2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardtable2">GetIpForwardTable2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeipforwardentry">InitializeIpForwardEntry</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyroutechange2">NotifyRouteChange2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipforwardentry2">SetIpForwardEntry2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-ip_address_prefix
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADDRESS_PREFIX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The prefix or network part of IP the address represented as an IP address.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a> union is defined in the <i>Ws2ipdef.h</i> header.
     * @type {SOCKADDR_INET}
     */
    Prefix{
        get {
            if(!this.HasProp("__Prefix"))
                this.__Prefix := SOCKADDR_INET(this.ptr + 0)
            return this.__Prefix
        }
    }

    /**
     * The length, in bits, of the prefix or network part of the IP address. For a unicast IPv4 address, any value greater than 32 is an illegal value. For a unicast IPv6 address, any value greater than 128 is an illegal value. 
     * A value of 255 is commonly used to represent an illegal value.
     * @type {Integer}
     */
    PrefixLength {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }
}
