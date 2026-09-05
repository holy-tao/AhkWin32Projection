#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_PROPERTY_ID extends Win32Enum {

    /**
     * Native name: DhcpPropIdPolicyDnsSuffix
     * @type {Integer (Int32)}
     */
    static PropIdPolicyDnsSuffix => 0

    /**
     * Native name: DhcpPropIdClientAddressStateEx
     * @type {Integer (Int32)}
     */
    static PropIdClientAddressStateEx => 1
}
