#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_POLICY_FIELDS_TO_UPDATE enumeration defines which properties of a DHCP server policy must be updated.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_policy_fields_to_update
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_POLICY_FIELDS_TO_UPDATE extends Win32Enum {

    /**
     * Update DHCP server policy name.
     * Native name: DhcpUpdatePolicyName
     * @type {Integer (Int32)}
     */
    static PolicyName => 1

    /**
     * Update DHCP server policy order.
     * Native name: DhcpUpdatePolicyOrder
     * @type {Integer (Int32)}
     */
    static PolicyOrder => 2

    /**
     * Update DHCP server policy expression.
     * Native name: DhcpUpdatePolicyExpr
     * @type {Integer (Int32)}
     */
    static PolicyExpr => 4

    /**
     * Update DHCP server policy ranges.
     * Native name: DhcpUpdatePolicyRanges
     * @type {Integer (Int32)}
     */
    static PolicyRanges => 8

    /**
     * Update DHCP server policy description.
     * Native name: DhcpUpdatePolicyDescr
     * @type {Integer (Int32)}
     */
    static PolicyDescr => 16

    /**
     * Update DHCP server policy enabled/disabled status.
     * Native name: DhcpUpdatePolicyStatus
     * @type {Integer (Int32)}
     */
    static PolicyStatus => 32

    /**
     * Native name: DhcpUpdatePolicyDnsSuffix
     * @type {Integer (Int32)}
     */
    static PolicyDnsSuffix => 64
}
