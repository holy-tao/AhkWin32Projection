#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_STATUS_INFO_STATUS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_INTERNAL_REFERENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_KEY_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_DIGESTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_DIGEST_VALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_SIGNATURE_VALID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_OPENED_TO_ENCODE => 2147483648
}
