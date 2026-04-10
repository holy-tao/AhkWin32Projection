#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_PROPERTY_ID extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropIdPolicyDnsSuffix => 0

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropIdClientAddressStateEx => 1
}
