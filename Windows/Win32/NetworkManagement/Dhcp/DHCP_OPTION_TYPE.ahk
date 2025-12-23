#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_OPTION_TYPE enumeration defines the set of possible DHCP option types.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_TYPE extends Win32Enum{

    /**
     * The option has a single data item associated with it.
     * @type {Integer (Int32)}
     */
    static DhcpUnaryElementTypeOption => 0

    /**
     * The option is an array of data items associated with it.
     * @type {Integer (Int32)}
     */
    static DhcpArrayTypeOption => 1
}
