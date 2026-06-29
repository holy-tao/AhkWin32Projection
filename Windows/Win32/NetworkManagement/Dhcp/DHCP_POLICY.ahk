#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POL_EXPR_ARRAY.ahk" { DHCP_POL_EXPR_ARRAY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_POL_COND_ARRAY.ahk" { DHCP_POL_COND_ARRAY }
#Import ".\DHCP_IP_RANGE_ARRAY.ahk" { DHCP_IP_RANGE_ARRAY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DHCP_POLICY structure defines a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_policy
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POLICY {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCP server policy name.
     */
    PolicyName : PWSTR

    /**
     * <b>TRUE</b> if the DHCP server policy is global. Otherwise, it is <b>FALSE</b>.
     */
    IsGlobalPolicy : BOOL

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that specifies the IPv4 subnet ID for a scope level policy.
     */
    Subnet : UInt32

    /**
     * Integer that specifies the processing order of the DHCP server policy. 1 indicates the highest priority and <b>MAX_DWORD</b> indicates the lowest.
     */
    ProcessingOrder : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_expr_array">DHCP_POL_EXPR_ARRAY</a> that specifies the DHCP server policy conditions.
     */
    Conditions : DHCP_POL_COND_ARRAY.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_expr_array">DHCP_POL_EXPR_ARRAY</a> that specifies the DHCP server policy expressions.
     */
    Expressions : DHCP_POL_EXPR_ARRAY.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range_array">DHCP_IP_RANGE_ARRAY</a> that specifies the DHCP server IPv4 range associated with the policy.
     */
    Ranges : DHCP_IP_RANGE_ARRAY.Ptr

    /**
     * A pointer to a null-terminated Unicode string that contains the description of the DHCP server policy.
     */
    Description : PWSTR

    /**
     * <b>TRUE</b> if the policy is enabled. Otherwise, it is <b>FALSE</b>.
     */
    Enabled : BOOL

}
