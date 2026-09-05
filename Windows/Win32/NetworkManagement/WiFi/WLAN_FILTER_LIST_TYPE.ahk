#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates types of filter lists.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_filter_list_type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_FILTER_LIST_TYPE extends Win32Enum {

    /**
     * Group policy permit list.
     * Native name: wlan_filter_list_type_gp_permit
     * @type {Integer (Int32)}
     */
    static gp_permit => 0

    /**
     * Group policy deny list.
     * Native name: wlan_filter_list_type_gp_deny
     * @type {Integer (Int32)}
     */
    static gp_deny => 1

    /**
     * User permit list.
     * Native name: wlan_filter_list_type_user_permit
     * @type {Integer (Int32)}
     */
    static user_permit => 2

    /**
     * User deny list.
     * Native name: wlan_filter_list_type_user_deny
     * @type {Integer (Int32)}
     */
    static user_deny => 3
}
