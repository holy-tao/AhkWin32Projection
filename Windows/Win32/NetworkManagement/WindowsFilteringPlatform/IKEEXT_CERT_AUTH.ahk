#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_CERT_AUTH extends Win32BitflagEnum {

    /**
     * Native name: IKEEXT_CERT_AUTH_FLAG_SSL_ONE_WAY
     * @type {Integer (UInt32)}
     */
    static FLAG_SSL_ONE_WAY => 1

    /**
     * Native name: IKEEXT_CERT_AUTH_ENABLE_CRL_CHECK_STRONG
     * @type {Integer (UInt32)}
     */
    static ENABLE_CRL_CHECK_STRONG => 4

    /**
     * Native name: IKEEXT_CERT_AUTH_DISABLE_SSL_CERT_VALIDATION
     * @type {Integer (UInt32)}
     */
    static DISABLE_SSL_CERT_VALIDATION => 8

    /**
     * Native name: IKEEXT_CERT_AUTH_ALLOW_HTTP_CERT_LOOKUP
     * @type {Integer (UInt32)}
     */
    static ALLOW_HTTP_CERT_LOOKUP => 16

    /**
     * Native name: IKEEXT_CERT_AUTH_URL_CONTAINS_BUNDLE
     * @type {Integer (UInt32)}
     */
    static URL_CONTAINS_BUNDLE => 32
}
