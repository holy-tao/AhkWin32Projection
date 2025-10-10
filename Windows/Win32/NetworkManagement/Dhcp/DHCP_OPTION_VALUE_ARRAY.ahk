#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_OPTION_VALUE_ARRAY structure defines a list of DHCP option values (just the option data with associated ID tags).
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_option_value_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_VALUE_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of option values listed in <b>Values</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structures containing DHCP  option values.
     * @type {Pointer<DHCP_OPTION_VALUE>}
     */
    Values {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
