#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_CERT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: IKEEXT_CERT_FLAG_ENABLE_ACCOUNT_MAPPING
     * @type {Integer (UInt32)}
     */
    static FLAG_ENABLE_ACCOUNT_MAPPING => 1

    /**
     * Native name: IKEEXT_CERT_FLAG_DISABLE_REQUEST_PAYLOAD
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLE_REQUEST_PAYLOAD => 2

    /**
     * Native name: IKEEXT_CERT_FLAG_USE_NAP_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static FLAG_USE_NAP_CERTIFICATE => 4

    /**
     * Native name: IKEEXT_CERT_FLAG_INTERMEDIATE_CA
     * @type {Integer (UInt32)}
     */
    static FLAG_INTERMEDIATE_CA => 8

    /**
     * Native name: IKEEXT_CERT_FLAG_IGNORE_INIT_CERT_MAP_FAILURE
     * @type {Integer (UInt32)}
     */
    static FLAG_IGNORE_INIT_CERT_MAP_FAILURE => 16

    /**
     * Native name: IKEEXT_CERT_FLAG_PREFER_NAP_CERTIFICATE_OUTBOUND
     * @type {Integer (UInt32)}
     */
    static FLAG_PREFER_NAP_CERTIFICATE_OUTBOUND => 32

    /**
     * Native name: IKEEXT_CERT_FLAG_SELECT_NAP_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static FLAG_SELECT_NAP_CERTIFICATE => 64

    /**
     * Native name: IKEEXT_CERT_FLAG_VERIFY_NAP_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static FLAG_VERIFY_NAP_CERTIFICATE => 128

    /**
     * Native name: IKEEXT_CERT_FLAG_FOLLOW_RENEWAL_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static FLAG_FOLLOW_RENEWAL_CERTIFICATE => 256
}
