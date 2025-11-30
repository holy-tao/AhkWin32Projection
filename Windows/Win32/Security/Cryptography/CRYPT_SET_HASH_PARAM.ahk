#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SET_HASH_PARAM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static HP_HMAC_INFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static HP_HASHVAL => 2
}
