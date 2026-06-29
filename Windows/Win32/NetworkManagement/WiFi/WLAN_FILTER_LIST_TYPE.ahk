#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates types of filter lists.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_filter_list_type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_FILTER_LIST_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Group policy permit list.
     * @type {Integer (Int32)}
     */
    static wlan_filter_list_type_gp_permit => 0

    /**
     * Group policy deny list.
     * @type {Integer (Int32)}
     */
    static wlan_filter_list_type_gp_deny => 1

    /**
     * User permit list.
     * @type {Integer (Int32)}
     */
    static wlan_filter_list_type_user_permit => 2

    /**
     * User deny list.
     * @type {Integer (Int32)}
     */
    static wlan_filter_list_type_user_deny => 3
}
