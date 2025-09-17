#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_OPTION_DATA.ahk

/**
 * The DHCP_OPTION structure defines a single DHCP option and any data elements associated with it.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies a unique ID number (also called a "code") for this option.
     * @type {Integer}
     */
    OptionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unicode string that contains the name of this option.
     * @type {Pointer<Char>}
     */
    OptionName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unicode string that contains a comment about this option.
     * @type {Pointer<Char>}
     */
    OptionComment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data associated with this option.
     * @type {DHCP_OPTION_DATA}
     */
    DefaultValue{
        get {
            if(!this.HasProp("__DefaultValue"))
                this.__DefaultValue := DHCP_OPTION_DATA(this.ptr + 24)
            return this.__DefaultValue
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_type">DHCP_OPTION_TYPE</a> enumeration value that indicates whether this option is a single unary item or an element in an array of options.
     * @type {Integer}
     */
    OptionType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
