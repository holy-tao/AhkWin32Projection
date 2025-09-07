#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of filter lists available on the DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_filter_list_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FILTER_LIST_TYPE{

    /**
     * The filter list is a deny list.
     * @type {Integer (Int32)}
     */
    static Deny => 0

    /**
     * The filter list is an allow list.
     * @type {Integer (Int32)}
     */
    static Allow => 1
}
