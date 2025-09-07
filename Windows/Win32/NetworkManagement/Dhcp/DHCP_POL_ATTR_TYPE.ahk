#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DHCP_POL_ATTR_TYPE enumeration defines the attribute type for a condition in a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_attr_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_ATTR_TYPE{

    /**
     * The condition is based on the hardware address (MAC address) present in the <b>chaddr</b> field of the DHCP message header as defined in <a href="http://www.ietf.org/rfc/rfc2131.txt">RFC2131</a>.
     * @type {Integer (Int32)}
     */
    static DhcpAttrHWAddr => 0

    /**
     * The condition is based on a DHCP option.
     * @type {Integer (Int32)}
     */
    static DhcpAttrOption => 1

    /**
     * The condition is based on a DHCP sub-option
     * @type {Integer (Int32)}
     */
    static DhcpAttrSubOption => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpAttrFqdn => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpAttrFqdnSingleLabel => 4
}
