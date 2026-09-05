#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_KEY_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: CRYPT_XML_KEY_VALUE_TYPE_DSA
     * @type {Integer (UInt32)}
     */
    static DSA => 1

    /**
     * Native name: CRYPT_XML_KEY_VALUE_TYPE_RSA
     * @type {Integer (UInt32)}
     */
    static RSA => 2

    /**
     * Native name: CRYPT_XML_KEY_VALUE_TYPE_ECDSA
     * @type {Integer (UInt32)}
     */
    static ECDSA => 3

    /**
     * Native name: CRYPT_XML_KEY_VALUE_TYPE_CUSTOM
     * @type {Integer (UInt32)}
     */
    static CUSTOM => 4
}
