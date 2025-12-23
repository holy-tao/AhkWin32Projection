#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_FLAG_DISABLE_EXTENSIONS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_FLAG_NO_SERIALIZE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_SIGN_ADD_KEYVALUE => 1
}
