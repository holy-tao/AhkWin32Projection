#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_BLOCK_PADDING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PAD_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PAD_OAEP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PAD_PKCS1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PAD_PSS => 8
}
