#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_GET_URL_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_PROPERTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_EXTENSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE => 8
}
