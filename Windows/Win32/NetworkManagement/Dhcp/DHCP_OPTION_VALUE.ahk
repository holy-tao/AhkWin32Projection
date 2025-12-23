#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_OPTION_DATA.ahk

/**
 * The DHCP_OPTION_VALUE structure defines a DHCP option value (just the option data with an associated ID tag).
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_VALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies a unique ID number for the option.
     * @type {Integer}
     */
    OptionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data for a DHCP server option.
     * @type {DHCP_OPTION_DATA}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := DHCP_OPTION_DATA(8, this)
            return this.__Value
        }
    }
}
