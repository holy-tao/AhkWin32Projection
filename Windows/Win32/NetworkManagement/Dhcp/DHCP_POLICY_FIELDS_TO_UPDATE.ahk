#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DHCP_POLICY_FIELDS_TO_UPDATE enumeration defines which properties of a DHCP server policy must be updated.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_policy_fields_to_update
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POLICY_FIELDS_TO_UPDATE{

    /**
     * Update DHCP server policy name.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyName => 1

    /**
     * Update DHCP server policy order.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyOrder => 2

    /**
     * Update DHCP server policy expression.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyExpr => 4

    /**
     * Update DHCP server policy ranges.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyRanges => 8

    /**
     * Update DHCP server policy description.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyDescr => 16

    /**
     * Update DHCP server policy enabled/disabled status.
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyStatus => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpUpdatePolicyDnsSuffix => 64
}
