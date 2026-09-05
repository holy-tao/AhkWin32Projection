#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class DOMAIN_PASSWORD_PROPERTIES extends Win32BitflagEnum {

    /**
     * Native name: DOMAIN_PASSWORD_COMPLEX
     * @type {Integer (UInt32)}
     */
    static COMPLEX => 1

    /**
     * Native name: DOMAIN_PASSWORD_NO_ANON_CHANGE
     * @type {Integer (UInt32)}
     */
    static NO_ANON_CHANGE => 2

    /**
     * Native name: DOMAIN_PASSWORD_NO_CLEAR_CHANGE
     * @type {Integer (UInt32)}
     */
    static NO_CLEAR_CHANGE => 4

    /**
     * Native name: DOMAIN_LOCKOUT_ADMINS
     * @type {Integer (UInt32)}
     */
    static LOCKOUT_ADMINS => 8

    /**
     * Native name: DOMAIN_PASSWORD_STORE_CLEARTEXT
     * @type {Integer (UInt32)}
     */
    static STORE_CLEARTEXT => 16

    /**
     * Native name: DOMAIN_REFUSE_PASSWORD_CHANGE
     * @type {Integer (UInt32)}
     */
    static REFUSE_PASSWORD_CHANGE => 32
}
