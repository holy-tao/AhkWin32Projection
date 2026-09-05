#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_FIND_FLAGS extends Win32Enum {

    /**
     * Native name: CRYPT_FIND_USER_KEYSET_FLAG
     * @type {Integer (UInt32)}
     */
    static USER_KEYSET_FLAG => 1

    /**
     * Native name: CRYPT_FIND_MACHINE_KEYSET_FLAG
     * @type {Integer (UInt32)}
     */
    static MACHINE_KEYSET_FLAG => 2

    /**
     * Native name: CRYPT_FIND_SILENT_KEYSET_FLAG
     * @type {Integer (UInt32)}
     */
    static SILENT_KEYSET_FLAG => 64
}
