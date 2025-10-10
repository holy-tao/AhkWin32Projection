#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data that defines an array of DHCP_SUBNET_ELEMENT_DATA_V6 IPv6 prefix elements.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <b>DWORD</b> value containing the number of IPv6 subnet elements in the <b>Elements</b> member.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v6">DHCP_SUBNET_ELEMENT_DATA_V6</a> structures that contain IPv6 prefix elements.
     * @type {Pointer<DHCP_SUBNET_ELEMENT_DATA_V6>}
     */
    Elements {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
