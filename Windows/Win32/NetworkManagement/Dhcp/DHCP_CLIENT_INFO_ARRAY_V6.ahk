#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an array of DHCP_CLIENT_INFO_V6 structures for use with DHCPv6 client enumeration functions.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_ARRAY_V6 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of elements present in <b>Clients</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_V6</a> structures that contain information on specific DHCPv6 subnet clients, including the dynamic address type (DHCP and/or BOOTP) and address state information.
     * @type {Pointer<DHCP_CLIENT_INFO_V6>}
     */
    Clients {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
