#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_POL_LOGIC_OPER enumeration defines how to group the constituent conditions and sub-expressions of an expression in a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POL_LOGIC_OPER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
