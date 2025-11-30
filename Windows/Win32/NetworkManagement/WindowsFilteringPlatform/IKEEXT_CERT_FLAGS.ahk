#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_ENABLE_ACCOUNT_MAPPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_DISABLE_REQUEST_PAYLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_USE_NAP_CERTIFICATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_INTERMEDIATE_CA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_IGNORE_INIT_CERT_MAP_FAILURE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_PREFER_NAP_CERTIFICATE_OUTBOUND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_SELECT_NAP_CERTIFICATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_VERIFY_NAP_CERTIFICATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_FLAG_FOLLOW_RENEWAL_CERTIFICATE => 256
}
