#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the types of filter lists available on the DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_filter_list_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FILTER_LIST_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
