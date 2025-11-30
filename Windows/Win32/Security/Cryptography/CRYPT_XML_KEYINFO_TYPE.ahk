#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEYINFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_KEYNAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_KEYVALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_RETRIEVAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_X509DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_CUSTOM => 5
}
