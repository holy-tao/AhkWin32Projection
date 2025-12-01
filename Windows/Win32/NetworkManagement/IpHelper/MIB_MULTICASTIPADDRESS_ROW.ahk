#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk

/**
 * Stores information about a multicast IP address.
 * @remarks
 * The <b>MIB_MULTICASTIPADDRESS_ROW</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddresstable">GetMulticastIpAddressTable</a> function enumerates the multicast IP addresses on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddressentry">GetMulticastIpAddressEntry</a> function retrieves a single multicast IP address and returns this information in a <b>MIB_MULTICASTIPADDRESS_ROW</b> structure.
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_multicastipaddress_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_MULTICASTIPADDRESS_ROW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The multicast IP address. This member can be an IPv6 address or an IPv4 address.
     * @type {SOCKADDR_INET}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKADDR_INET(0, this)
            return this.__Address
        }
    }

    /**
     * The local index value for the network interface associated with this IP address. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The locally unique identifier (LUID) for the network interface associated with this IP address.
     * @type {NET_LUID_LH}
     */
    InterfaceLuid{
        get {
            if(!this.HasProp("__InterfaceLuid"))
                this.__InterfaceLuid := NET_LUID_LH(72, this)
            return this.__InterfaceLuid
        }
    }

    /**
     * The scope ID of the multicast IP address. This member is applicable only to an IPv6 address. This member cannot be set. It is automatically determined by the interface on which the address was added.
     * @type {SCOPE_ID}
     */
    ScopeId{
        get {
            if(!this.HasProp("__ScopeId"))
                this.__ScopeId := SCOPE_ID(88, this)
            return this.__ScopeId
        }
    }
}
