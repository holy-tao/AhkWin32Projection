#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_DOSP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: IPSEC_DOSP_FLAG_ENABLE_IKEV1
     * @type {Integer (UInt32)}
     */
    static FLAG_ENABLE_IKEV1 => 1

    /**
     * Native name: IPSEC_DOSP_FLAG_ENABLE_IKEV2
     * @type {Integer (UInt32)}
     */
    static FLAG_ENABLE_IKEV2 => 2

    /**
     * Native name: IPSEC_DOSP_FLAG_DISABLE_AUTHIP
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLE_AUTHIP => 4

    /**
     * Native name: IPSEC_DOSP_FLAG_DISABLE_DEFAULT_BLOCK
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLE_DEFAULT_BLOCK => 8

    /**
     * Native name: IPSEC_DOSP_FLAG_FILTER_BLOCK
     * @type {Integer (UInt32)}
     */
    static FLAG_FILTER_BLOCK => 16

    /**
     * Native name: IPSEC_DOSP_FLAG_FILTER_EXEMPT
     * @type {Integer (UInt32)}
     */
    static FLAG_FILTER_EXEMPT => 32
}
