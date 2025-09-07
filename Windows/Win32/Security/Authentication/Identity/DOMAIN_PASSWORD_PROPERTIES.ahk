#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class DOMAIN_PASSWORD_PROPERTIES{

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_PASSWORD_COMPLEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_PASSWORD_NO_ANON_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_PASSWORD_NO_CLEAR_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_LOCKOUT_ADMINS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_PASSWORD_STORE_CLEARTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_REFUSE_PASSWORD_CHANGE => 32
}
