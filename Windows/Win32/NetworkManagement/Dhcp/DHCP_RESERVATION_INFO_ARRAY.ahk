#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_RESERVATION_INFO_ARRAY structure defines an array of IPv4 reservations for DHCPv4 clients.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_reservation_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_RESERVATION_INFO_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of IPv4 client reservations in <b>Elements</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_info">DHCP_IP_RESERVATION_INFO</a> structures that contain IPv4 client reservations.
     * @type {Pointer<Pointer<DHCP_IP_RESERVATION_INFO>>}
     */
    Elements {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
