#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the IP version. (FWP_IP_VERSION)
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_ip_version
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_IP_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies IPv4.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_V4 => 0

    /**
     * Specifies IPv6.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_V6 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_NONE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_MAX => 3
}
