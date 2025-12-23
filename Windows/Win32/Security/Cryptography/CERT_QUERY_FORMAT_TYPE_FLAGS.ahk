#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QUERY_FORMAT_TYPE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_BINARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_ALL => 14
}
