#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPTGENRANDOM_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RNG_USE_ENTROPY_IN_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_USE_SYSTEM_PREFERRED_RNG => 2
}
