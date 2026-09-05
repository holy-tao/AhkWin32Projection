#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_STATUS_ERROR_STATUS extends Win32Enum {

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_NOT_RESOLVED
     * @type {Integer (UInt32)}
     */
    static NOT_RESOLVED => 1

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_DIGEST_INVALID
     * @type {Integer (UInt32)}
     */
    static DIGEST_INVALID => 2

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_ALGORITHM
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_ALGORITHM => 5

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_TRANSFORM
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_TRANSFORM => 8

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_SIGNATURE_INVALID
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_INVALID => 65536

    /**
     * Native name: CRYPT_XML_STATUS_ERROR_KEYINFO_NOT_PARSED
     * @type {Integer (UInt32)}
     */
    static KEYINFO_NOT_PARSED => 131072
}
