#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_CONTEXT_CONFIG_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_EXCLUSIVE
     * @type {Integer (UInt32)}
     */
    static EXCLUSIVE => 1

    /**
     * Native name: CRYPT_OVERRIDE
     * @type {Integer (UInt32)}
     */
    static OVERRIDE => 65536
}
