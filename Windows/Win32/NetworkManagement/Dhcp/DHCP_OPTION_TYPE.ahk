#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_OPTION_TYPE enumeration defines the set of possible DHCP option types.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
