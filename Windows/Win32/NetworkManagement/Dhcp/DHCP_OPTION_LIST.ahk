#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a list of DHCP option values (just the option data with associated ID tags).
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_option_list
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of option values  listed in <b>Options</b>.
     * @type {Integer}
     */
    NumOptions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structures
     * @type {Pointer<DHCP_OPTION_VALUE>}
     */
    Options {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
