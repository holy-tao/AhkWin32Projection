#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_ALG_HANDLE_HMAC_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PROV_DISPATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_HASH_REUSABLE_FLAG => 32
}
