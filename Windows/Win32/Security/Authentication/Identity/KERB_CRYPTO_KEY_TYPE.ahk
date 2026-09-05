#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_CRYPTO_KEY_TYPE extends Win32Enum {

    /**
     * Native name: KERB_ETYPE_DES_CBC_CRC
     * @type {Integer (Int32)}
     */
    static ETYPE_DES_CBC_CRC => 1

    /**
     * Native name: KERB_ETYPE_DES_CBC_MD4
     * @type {Integer (Int32)}
     */
    static ETYPE_DES_CBC_MD4 => 2

    /**
     * Native name: KERB_ETYPE_DES_CBC_MD5
     * @type {Integer (Int32)}
     */
    static ETYPE_DES_CBC_MD5 => 3

    /**
     * Native name: KERB_ETYPE_NULL
     * @type {Integer (Int32)}
     */
    static ETYPE_NULL => 0

    /**
     * Native name: KERB_ETYPE_RC4_HMAC_NT
     * @type {Integer (Int32)}
     */
    static ETYPE_RC4_HMAC_NT => 23

    /**
     * Native name: KERB_ETYPE_RC4_MD4
     * @type {Integer (Int32)}
     */
    static ETYPE_RC4_MD4 => -128
}
