#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of IPsec traffic being described.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_TRAFFIC_TYPE extends Win32Enum {

    /**
     * Specifies transport traffic.
     * Native name: IPSEC_TRAFFIC_TYPE_TRANSPORT
     * @type {Integer (Int32)}
     */
    static TRANSPORT => 0

    /**
     * Specifies tunnel traffic.
     * Native name: IPSEC_TRAFFIC_TYPE_TUNNEL
     * @type {Integer (Int32)}
     */
    static TUNNEL => 1

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_TRAFFIC_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
