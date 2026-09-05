#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_QUERY_FORMAT_TYPE extends Win32Enum {

    /**
     * Native name: CERT_QUERY_FORMAT_BINARY
     * @type {Integer (UInt32)}
     */
    static BINARY => 1

    /**
     * Native name: CERT_QUERY_FORMAT_BASE64_ENCODED
     * @type {Integer (UInt32)}
     */
    static BASE64_ENCODED => 2

    /**
     * Native name: CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED
     * @type {Integer (UInt32)}
     */
    static ASN_ASCII_HEX_ENCODED => 3
}
