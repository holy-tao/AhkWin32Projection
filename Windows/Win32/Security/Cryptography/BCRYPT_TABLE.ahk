#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_TABLE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_LOCAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DOMAIN => 2
}
