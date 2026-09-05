#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_GROUP_ID extends Win32Enum {

    /**
     * Native name: CRYPT_XML_GROUP_ID_HASH
     * @type {Integer (UInt32)}
     */
    static HASH => 1

    /**
     * Native name: CRYPT_XML_GROUP_ID_SIGN
     * @type {Integer (UInt32)}
     */
    static SIGN => 2
}
