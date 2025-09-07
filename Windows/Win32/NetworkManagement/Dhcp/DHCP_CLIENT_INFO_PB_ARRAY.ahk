#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_CLIENT_INFO_PB_ARRAY structure defines an array of DHCPv4 client information elements.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_PB_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that contains the number of DHCPv4 clients in <b>Clients</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb">DHCP_CLIENT_INFO_PB</a> structures that contain DHCPv4 client information.
     * @type {Pointer<DHCP_CLIENT_INFO_PB>}
     */
    Clients {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
