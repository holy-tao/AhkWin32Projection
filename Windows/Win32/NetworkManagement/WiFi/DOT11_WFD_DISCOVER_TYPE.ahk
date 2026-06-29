#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DISCOVER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_scan_only => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_find_only => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_auto => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_scan_social_channels => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_forced => -2147483648
}
