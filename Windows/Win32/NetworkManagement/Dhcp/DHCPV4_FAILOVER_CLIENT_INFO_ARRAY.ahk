#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPV4_FAILOVER_CLIENT_INFO_ARRAY structure defines an array of DHCP server scope statistics that are part of a failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV4_FAILOVER_CLIENT_INFO_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of DHCP server scope statistics in <b>Clients</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info">DHCPV4_FAILOVER_CLIENT_INFO</a>  structures.
     * @type {Pointer<Pointer<DHCPV4_FAILOVER_CLIENT_INFO>>}
     */
    Clients {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
