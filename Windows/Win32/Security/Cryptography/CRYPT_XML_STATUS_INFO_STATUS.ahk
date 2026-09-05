#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_STATUS_INFO_STATUS extends Win32Enum {

    /**
     * Native name: CRYPT_XML_STATUS_INTERNAL_REFERENCE
     * @type {Integer (UInt32)}
     */
    static INTERNAL_REFERENCE => 1

    /**
     * Native name: CRYPT_XML_STATUS_KEY_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static KEY_AVAILABLE => 2

    /**
     * Native name: CRYPT_XML_STATUS_DIGESTING
     * @type {Integer (UInt32)}
     */
    static DIGESTING => 4

    /**
     * Native name: CRYPT_XML_STATUS_DIGEST_VALID
     * @type {Integer (UInt32)}
     */
    static DIGEST_VALID => 8

    /**
     * Native name: CRYPT_XML_STATUS_SIGNATURE_VALID
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_VALID => 65536

    /**
     * Native name: CRYPT_XML_STATUS_OPENED_TO_ENCODE
     * @type {Integer (UInt32)}
     */
    static OPENED_TO_ENCODE => 2147483648
}
