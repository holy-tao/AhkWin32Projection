#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_KEYINFO_TYPE extends Win32Enum {

    /**
     * Native name: CRYPT_XML_KEYINFO_TYPE_KEYNAME
     * @type {Integer (UInt32)}
     */
    static KEYNAME => 1

    /**
     * Native name: CRYPT_XML_KEYINFO_TYPE_KEYVALUE
     * @type {Integer (UInt32)}
     */
    static KEYVALUE => 2

    /**
     * Native name: CRYPT_XML_KEYINFO_TYPE_RETRIEVAL
     * @type {Integer (UInt32)}
     */
    static RETRIEVAL => 3

    /**
     * Native name: CRYPT_XML_KEYINFO_TYPE_X509DATA
     * @type {Integer (UInt32)}
     */
    static X509DATA => 4

    /**
     * Native name: CRYPT_XML_KEYINFO_TYPE_CUSTOM
     * @type {Integer (UInt32)}
     */
    static CUSTOM => 5
}
