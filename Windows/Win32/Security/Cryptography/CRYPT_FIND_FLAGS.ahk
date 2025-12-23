#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_FIND_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_FIND_USER_KEYSET_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_FIND_MACHINE_KEYSET_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_FIND_SILENT_KEYSET_FLAG => 64
}
