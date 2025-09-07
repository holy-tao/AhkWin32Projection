#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_STATUS_ERROR_STATUS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_NOT_RESOLVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_DIGEST_INVALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_ALGORITHM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_TRANSFORM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_SIGNATURE_INVALID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_KEYINFO_NOT_PARSED => 131072
}
