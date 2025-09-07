#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk

/**
 * Stores a single gateway address in a linked list of gateway addresses for a particular adapter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function. The <b>FirstGatewayAddress</b> member of the <b>IP_ADAPTER_ADDRESSES</b> structure is a pointer to a linked list of <b>IP_ADAPTER_GATEWAY_ADDRESS</b> structures. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure is used in the <b>IP_ADAPTER_GATEWAY_ADDRESS</b> structure. On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>SOCKET_ADDRESS</b> structure is defined in the <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. On the Platform Software Development Kit (SDK) released for Windows Server 2003 and Windows XP, the <b>SOCKET_ADDRESS</b> structure is declared in the <i>Winsock2.h</i> header file. In order to use the <b>IP_ADAPTER_GATEWAY_ADDRESS</b> structure, the <i>Winsock2.h</i> header file must be included before the <i>Iphlpapi.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_gateway_address_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_GATEWAY_ADDRESS_LH extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the next gateway address structure in the list.
     * @type {Pointer<IP_ADAPTER_GATEWAY_ADDRESS_LH>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The IP address for this gateway entry. This member can be an IPv6 address or an IPv4 address.
     * @type {SOCKET_ADDRESS}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKET_ADDRESS(this.ptr + 16)
            return this.__Address
        }
    }
}
