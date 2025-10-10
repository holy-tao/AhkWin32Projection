#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DHCP_POL_LOGIC_OPER enumeration defines how to group the constituent conditions and sub-expressions of an expression in a DHCP server policy.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_LOGIC_OPER{

    /**
     * The results of the constituent conditions and sub-expressions must be logically ORed to evaluate the expression.
     * @type {Integer (Int32)}
     */
    static DhcpLogicalOr => 0

    /**
     * The results of the constituent conditions and sub-expressions must be logically ANDed to evaluate the expression.
     * @type {Integer (Int32)}
     */
    static DhcpLogicalAnd => 1
}
