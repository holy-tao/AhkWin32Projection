#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: BCRYPT_ALG_HANDLE_HMAC_FLAG
     * @type {Integer (UInt32)}
     */
    static ALG_HANDLE_HMAC_FLAG => 8

    /**
     * Native name: BCRYPT_PROV_DISPATCH
     * @type {Integer (UInt32)}
     */
    static PROV_DISPATCH => 1

    /**
     * Native name: BCRYPT_HASH_REUSABLE_FLAG
     * @type {Integer (UInt32)}
     */
    static HASH_REUSABLE_FLAG => 32
}
