#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_GET_URL_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_GET_URL_FROM_PROPERTY
     * @type {Integer (UInt32)}
     */
    static FROM_PROPERTY => 1

    /**
     * Native name: CRYPT_GET_URL_FROM_EXTENSION
     * @type {Integer (UInt32)}
     */
    static FROM_EXTENSION => 2

    /**
     * Native name: CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static FROM_UNAUTH_ATTRIBUTE => 4

    /**
     * Native name: CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static FROM_AUTH_ATTRIBUTE => 8
}
