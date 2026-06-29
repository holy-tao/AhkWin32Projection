#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_POL_COMPARATOR.ahk" { DHCP_POL_COMPARATOR }
#Import ".\DHCP_POL_ATTR_TYPE.ahk" { DHCP_POL_ATTR_TYPE }

/**
 * The DHCP_POL_COND structure defines the DHCP server policy condition.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_cond
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POL_COND {
    #StructPack 8

    /**
     * Integer that specifies the expression index that corresponds to this constituent condition.
     */
    ParentExpr : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_attr_type">DHCP_POL_ATTR_TYPE</a> enumeration that specifies the attribute type for this condition.
     */
    Type : DHCP_POL_ATTR_TYPE

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique option identifier for criteria based on DHCP options or sub-options.
     */
    OptionID : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique sub-option identifier.
     */
    SubOptionID : UInt32

    /**
     * A pointer to a null-terminated Unicode string that represents the vendor name.
     */
    VendorName : PWSTR

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator">DHCP_POL_COMPARATOR</a> enumeration that specifies the comparison operator for the condition.
     */
    Operator : DHCP_POL_COMPARATOR

    /**
     * Pointer to an array of bytes that contains the value to be used for the comparison.
     */
    Value : IntPtr

    ValueLength : UInt32

}
