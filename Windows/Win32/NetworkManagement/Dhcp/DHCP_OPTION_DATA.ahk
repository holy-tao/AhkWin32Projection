#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_OPTION_DATA structure defines a data container for one or more data elements associated with a DHCP option.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of option data elements listed in <b>Elements</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data_element">DHCP_OPTION_DATA_ELEMENT</a> structures that contain the data elements associated with this particular option element.
     * @type {Pointer<DHCP_OPTION_DATA_ELEMENT>}
     */
    Elements {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
