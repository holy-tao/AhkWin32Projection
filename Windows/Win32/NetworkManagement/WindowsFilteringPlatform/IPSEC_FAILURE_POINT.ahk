#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * At what point IPsec has failed.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_failure_point
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_FAILURE_POINT extends Win32Enum {

    /**
     * IPsec has not failed.
     * Native name: IPSEC_FAILURE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The local system is the failure point.
     * Native name: IPSEC_FAILURE_ME
     * @type {Integer (Int32)}
     */
    static ME => 1

    /**
     * A peer system is the failure point.
     * Native name: IPSEC_FAILURE_PEER
     * @type {Integer (Int32)}
     */
    static PEER => 2

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_FAILURE_POINT_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
