#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_POL_COMPARATOR enumeration defines the comparison operator for a condition when building a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_POL_COMPARATOR extends Win32Enum {

    /**
     * The DHCP client message field specified by the criterion must exactly match the value supplied in the condition.
     * Native name: DhcpCompEqual
     * @type {Integer (Int32)}
     */
    static CompEqual => 0

    /**
     * The DHCP client message field specified by the criterion must not exactly match the value supplied in the condition.
     * Native name: DhcpCompNotEqual
     * @type {Integer (Int32)}
     */
    static CompNotEqual => 1

    /**
     * The DHCP client message field specified by the criterion must begin with the value supplied in the condition.
     * Native name: DhcpCompBeginsWith
     * @type {Integer (Int32)}
     */
    static CompBeginsWith => 2

    /**
     * The DHCP client message field specified by the criterion must not begin with the value supplied in the condition.
     * Native name: DhcpCompNotBeginWith
     * @type {Integer (Int32)}
     */
    static CompNotBeginWith => 3

    /**
     * Native name: DhcpCompEndsWith
     * @type {Integer (Int32)}
     */
    static CompEndsWith => 4

    /**
     * Native name: DhcpCompNotEndWith
     * @type {Integer (Int32)}
     */
    static CompNotEndWith => 5
}
