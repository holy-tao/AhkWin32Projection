#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * At what point IPsec has failed.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_failure_point
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_FAILURE_POINT extends Win32Enum{

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
