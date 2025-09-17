#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_POL_COND structure defines the DHCP server policy condition.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_cond
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_COND extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Integer that specifies the expression index that corresponds to this constituent condition.
     * @type {Integer}
     */
    ParentExpr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_attr_type">DHCP_POL_ATTR_TYPE</a> enumeration that specifies the attribute type for this condition.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique option identifier for criteria based on DHCP options or sub-options.
     * @type {Integer}
     */
    OptionID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique sub-option identifier.
     * @type {Integer}
     */
    SubOptionID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to a null-terminated Unicode string that represents the vendor name.
     * @type {Pointer<Char>}
     */
    VendorName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator">DHCP_POL_COMPARATOR</a> enumeration that specifies the comparison operator for the condition.
     * @type {Integer}
     */
    Operator {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Pointer to an array of bytes that contains the value to be used for the comparison.
     * @type {Pointer<Byte>}
     */
    Value {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    ValueLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
