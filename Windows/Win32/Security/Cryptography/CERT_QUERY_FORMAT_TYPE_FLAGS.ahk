#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_QUERY_FORMAT_TYPE_FLAGS extends Win32Enum {

    /**
     * Native name: CERT_QUERY_FORMAT_FLAG_BINARY
     * @type {Integer (UInt32)}
     */
    static FLAG_BINARY => 2

    /**
     * Native name: CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED
     * @type {Integer (UInt32)}
     */
    static FLAG_BASE64_ENCODED => 4

    /**
     * Native name: CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED
     * @type {Integer (UInt32)}
     */
    static FLAG_ASN_ASCII_HEX_ENCODED => 8

    /**
     * Native name: CERT_QUERY_FORMAT_FLAG_ALL
     * @type {Integer (UInt32)}
     */
    static FLAG_ALL => 14
}
