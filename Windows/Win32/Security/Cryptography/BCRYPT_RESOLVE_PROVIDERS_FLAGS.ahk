#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_RESOLVE_PROVIDERS_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ALL_FUNCTIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ALL_PROVIDERS => 2
}
