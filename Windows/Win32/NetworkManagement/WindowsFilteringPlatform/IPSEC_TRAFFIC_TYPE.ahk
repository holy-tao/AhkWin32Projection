#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of IPsec traffic being described.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRAFFIC_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies transport traffic.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRAFFIC_TYPE_TRANSPORT => 0

    /**
     * Specifies tunnel traffic.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRAFFIC_TYPE_TUNNEL => 1

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRAFFIC_TYPE_MAX => 2
}
