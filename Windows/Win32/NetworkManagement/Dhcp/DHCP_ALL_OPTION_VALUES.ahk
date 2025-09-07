#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the set of all option values defined on a DHCP server, organized according to class/vendor pairing.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_ALL_OPTION_VALUES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved. This field should be set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of elements in <b>Options</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a list of [DHCP_OPTION_VALUE_ARRAY](/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array) structures that contain the option values for specific class/vendor pairs.
     * @type {Pointer<_Anonymous_e__Struct>}
     */
    Options {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
