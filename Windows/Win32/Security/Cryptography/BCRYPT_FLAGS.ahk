#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: BCRYPT_BLOCK_PADDING
     * @type {Integer (UInt32)}
     */
    static BLOCK_PADDING => 1

    /**
     * Native name: BCRYPT_PAD_NONE
     * @type {Integer (UInt32)}
     */
    static PAD_NONE => 1

    /**
     * Native name: BCRYPT_PAD_OAEP
     * @type {Integer (UInt32)}
     */
    static PAD_OAEP => 4

    /**
     * Native name: BCRYPT_PAD_PKCS1
     * @type {Integer (UInt32)}
     */
    static PAD_PKCS1 => 2

    /**
     * Native name: BCRYPT_PAD_PSS
     * @type {Integer (UInt32)}
     */
    static PAD_PSS => 8
}
