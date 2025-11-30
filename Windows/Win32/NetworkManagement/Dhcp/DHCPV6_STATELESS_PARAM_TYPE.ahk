#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCPV6_STATELESS_PARAM_TYPE enumeration defines a DHCPv6 stateless client inventory configuration parameter type.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcpv6_stateless_param_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6_STATELESS_PARAM_TYPE extends Win32Enum{

    /**
     * The parameter type is the purge interval for client lease records from the DHCP server database.
     * @type {Integer (Int32)}
     */
    static DhcpStatelessPurgeInterval => 1

    /**
     * The parameter type is the client inventory enabled/disabled status in the DHCP server database.
     * @type {Integer (Int32)}
     */
    static DhcpStatelessStatus => 2
}
