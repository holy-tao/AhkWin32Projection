#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * At what point IPsec has failed.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_failure_point
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_FAILURE_POINT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * IPsec has not failed.
     * @type {Integer (Int32)}
     */
    static IPSEC_FAILURE_NONE => 0

    /**
     * The local system is the failure point.
     * @type {Integer (Int32)}
     */
    static IPSEC_FAILURE_ME => 1

    /**
     * A peer system is the failure point.
     * @type {Integer (Int32)}
     */
    static IPSEC_FAILURE_PEER => 2

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_FAILURE_POINT_MAX => 3
}
