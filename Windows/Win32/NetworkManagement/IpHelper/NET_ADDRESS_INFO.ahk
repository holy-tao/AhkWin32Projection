#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR.ahk

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
 * @version v4.0.30319
 */
class NET_ADDRESS_INFO extends Win32Struct
{
    static sizeof => 536

    static packingSize => 8

    /**
     * Type: <b>NET_ADDRESS_FORMAT</b>
     * 
     * The format of the network address in the union in this structure. This member is an enumeration value from the [NET_ADDRESS_FORMAT](/windows/desktop/api/iphlpapi/ne-iphlpapi-net_address_format) enumeration declared in the <i>Iphlpapi.h</i> header file.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _NamedAddress extends Win32Struct {
        static sizeof => 524
        static packingSize => 2

        /**
         * @type {String}
         */
        Address {
            get => StrGet(this.ptr + 0, 255, "UTF-16")
            set => StrPut(value, this.ptr + 0, 255, "UTF-16")
        }
    
        /**
         * @type {String}
         */
        Port {
            get => StrGet(this.ptr + 512, 5, "UTF-16")
            set => StrPut(value, this.ptr + 512, 5, "UTF-16")
        }
    
    }

    /**
     * @type {_NamedAddress}
     */
    NamedAddress{
        get {
            if(!this.HasProp("__NamedAddress"))
                this.__NamedAddress := %this.__Class%._NamedAddress(8, this)
            return this.__NamedAddress
        }
    }

    /**
     * @type {SOCKADDR_IN}
     */
    Ipv4Address{
        get {
            if(!this.HasProp("__Ipv4Address"))
                this.__Ipv4Address := SOCKADDR_IN(8, this)
            return this.__Ipv4Address
        }
    }

    /**
     * @type {SOCKADDR_IN6}
     */
    Ipv6Address{
        get {
            if(!this.HasProp("__Ipv6Address"))
                this.__Ipv6Address := SOCKADDR_IN6(8, this)
            return this.__Ipv6Address
        }
    }

    /**
     * @type {SOCKADDR}
     */
    IpAddress{
        get {
            if(!this.HasProp("__IpAddress"))
                this.__IpAddress := SOCKADDR(8, this)
            return this.__IpAddress
        }
    }
}
