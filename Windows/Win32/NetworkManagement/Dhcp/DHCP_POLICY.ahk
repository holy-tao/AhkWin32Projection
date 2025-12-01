#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_POLICY structure defines a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_policy
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POLICY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCP server policy name.
     * @type {PWSTR}
     */
    PolicyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <b>TRUE</b> if the DHCP server policy is global. Otherwise, it is <b>FALSE</b>.
     * @type {BOOL}
     */
    IsGlobalPolicy {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that specifies the IPv4 subnet ID for a scope level policy.
     * @type {Integer}
     */
    Subnet {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Integer that specifies the processing order of the DHCP server policy. 1 indicates the highest priority and <b>MAX_DWORD</b> indicates the lowest.
     * @type {Integer}
     */
    ProcessingOrder {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_expr_array">DHCP_POL_EXPR_ARRAY</a> that specifies the DHCP server policy conditions.
     * @type {Pointer<DHCP_POL_COND_ARRAY>}
     */
    Conditions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_expr_array">DHCP_POL_EXPR_ARRAY</a> that specifies the DHCP server policy expressions.
     * @type {Pointer<DHCP_POL_EXPR_ARRAY>}
     */
    Expressions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range_array">DHCP_IP_RANGE_ARRAY</a> that specifies the DHCP server IPv4 range associated with the policy.
     * @type {Pointer<DHCP_IP_RANGE_ARRAY>}
     */
    Ranges {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the description of the DHCP server policy.
     * @type {PWSTR}
     */
    Description {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * <b>TRUE</b> if the policy is enabled. Otherwise, it is <b>FALSE</b>.
     * @type {BOOL}
     */
    Enabled {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
