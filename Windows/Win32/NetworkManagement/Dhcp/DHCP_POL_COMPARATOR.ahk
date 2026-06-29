#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_POL_COMPARATOR enumeration defines the comparison operator for a condition when building a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POL_COMPARATOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The DHCP client message field specified by the criterion must exactly match the value supplied in the condition.
     * @type {Integer (Int32)}
     */
    static DhcpCompEqual => 0

    /**
     * The DHCP client message field specified by the criterion must not exactly match the value supplied in the condition.
     * @type {Integer (Int32)}
     */
    static DhcpCompNotEqual => 1

    /**
     * The DHCP client message field specified by the criterion must begin with the value supplied in the condition.
     * @type {Integer (Int32)}
     */
    static DhcpCompBeginsWith => 2

    /**
     * The DHCP client message field specified by the criterion must not begin with the value supplied in the condition.
     * @type {Integer (Int32)}
     */
    static DhcpCompNotBeginWith => 3

    /**
     * @type {Integer (Int32)}
     */
    static DhcpCompEndsWith => 4

    /**
     * @type {Integer (Int32)}
     */
    static DhcpCompNotEndWith => 5
}
