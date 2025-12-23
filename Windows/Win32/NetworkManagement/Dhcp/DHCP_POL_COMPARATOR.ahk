#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_POL_COMPARATOR enumeration defines the comparison operator for a condition when building a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_COMPARATOR extends Win32Enum{

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
     * 
     * @type {Integer (Int32)}
     */
    static DhcpCompEndsWith => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpCompNotEndWith => 5
}
