#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_OPTION_ARRAY structure defines an array of DHCP server options.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of option elements in <b>Options</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structures containing DHCP server options and the associated data.
     * @type {Pointer<DHCP_OPTION>}
     */
    Options {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
