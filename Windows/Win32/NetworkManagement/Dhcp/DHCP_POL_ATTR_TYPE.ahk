#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_POL_ATTR_TYPE enumeration defines the attribute type for a condition in a DHCP server policy.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_attr_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_POL_ATTR_TYPE extends Win32Enum {

    /**
     * The condition is based on the hardware address (MAC address) present in the <b>chaddr</b> field of the DHCP message header as defined in <a href="http://www.ietf.org/rfc/rfc2131.txt">RFC2131</a>.
     * Native name: DhcpAttrHWAddr
     * @type {Integer (Int32)}
     */
    static AttrHWAddr => 0

    /**
     * The condition is based on a DHCP option.
     * Native name: DhcpAttrOption
     * @type {Integer (Int32)}
     */
    static Option => 1

    /**
     * The condition is based on a DHCP sub-option
     * Native name: DhcpAttrSubOption
     * @type {Integer (Int32)}
     */
    static SubOption => 2

    /**
     * Native name: DhcpAttrFqdn
     * @type {Integer (Int32)}
     */
    static Fqdn => 3

    /**
     * Native name: DhcpAttrFqdnSingleLabel
     * @type {Integer (Int32)}
     */
    static FqdnSingleLabel => 4
}
