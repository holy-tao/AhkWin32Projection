#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_AUTH extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_FLAG_SSL_ONE_WAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_ENABLE_CRL_CHECK_STRONG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_DISABLE_SSL_CERT_VALIDATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_ALLOW_HTTP_CERT_LOOKUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_URL_CONTAINS_BUNDLE => 32
}
