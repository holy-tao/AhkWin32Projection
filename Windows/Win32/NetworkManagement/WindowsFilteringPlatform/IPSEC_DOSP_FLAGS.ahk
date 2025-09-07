#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_DOSP_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_ENABLE_IKEV1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_ENABLE_IKEV2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_DISABLE_AUTHIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_DISABLE_DEFAULT_BLOCK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_FILTER_BLOCK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_FILTER_EXEMPT => 32
}
