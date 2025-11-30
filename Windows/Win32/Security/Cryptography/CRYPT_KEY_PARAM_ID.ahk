#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_KEY_PARAM_ID extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static KP_ALGID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KP_CERTIFICATE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static KP_PERMISSIONS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KP_SALT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KP_SALT_EX => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KP_BLOCKLEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KP_GET_USE_COUNT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static KP_KEYLEN => 9
}
