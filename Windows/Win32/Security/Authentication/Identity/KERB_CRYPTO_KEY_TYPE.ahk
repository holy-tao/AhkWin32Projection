#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CRYPTO_KEY_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_DES_CBC_CRC => 1

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_DES_CBC_MD4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_DES_CBC_MD5 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_HMAC_NT => 23

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_MD4 => -128
}
