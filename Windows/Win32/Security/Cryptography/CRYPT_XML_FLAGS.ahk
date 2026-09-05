#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_FLAGS extends Win32Enum {

    /**
     * Native name: CRYPT_XML_FLAG_DISABLE_EXTENSIONS
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLE_EXTENSIONS => 268435456

    /**
     * Native name: CRYPT_XML_FLAG_NO_SERIALIZE
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_SERIALIZE => 2147483648

    /**
     * Native name: CRYPT_XML_SIGN_ADD_KEYVALUE
     * @type {Integer (UInt32)}
     */
    static SIGN_ADD_KEYVALUE => 1
}
