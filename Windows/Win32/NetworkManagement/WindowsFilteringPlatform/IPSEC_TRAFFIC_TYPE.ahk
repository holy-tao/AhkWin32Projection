#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of IPsec traffic being described.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ne-ipsectypes-ipsec_traffic_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRAFFIC_TYPE{

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
