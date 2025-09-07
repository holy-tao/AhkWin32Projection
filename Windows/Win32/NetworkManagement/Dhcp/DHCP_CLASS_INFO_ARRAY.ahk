#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an array of elements that contain DHCP class information.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLASS_INFO_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of elements in <b>Classes</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structures that contain DHCP class information.
     * @type {Pointer<DHCP_CLASS_INFO>}
     */
    Classes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
