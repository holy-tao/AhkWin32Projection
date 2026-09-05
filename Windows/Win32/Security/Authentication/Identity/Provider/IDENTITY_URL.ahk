#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
class IDENTITY_URL extends Win32Enum {

    /**
     * Native name: IDENTITY_URL_CREATE_ACCOUNT_WIZARD
     * @type {Integer (Int32)}
     */
    static CREATE_ACCOUNT_WIZARD => 0

    /**
     * Native name: IDENTITY_URL_SIGN_IN_WIZARD
     * @type {Integer (Int32)}
     */
    static SIGN_IN_WIZARD => 1

    /**
     * Native name: IDENTITY_URL_CHANGE_PASSWORD_WIZARD
     * @type {Integer (Int32)}
     */
    static CHANGE_PASSWORD_WIZARD => 2

    /**
     * Native name: IDENTITY_URL_IFEXISTS_WIZARD
     * @type {Integer (Int32)}
     */
    static IFEXISTS_WIZARD => 3

    /**
     * Native name: IDENTITY_URL_ACCOUNT_SETTINGS
     * @type {Integer (Int32)}
     */
    static ACCOUNT_SETTINGS => 4

    /**
     * Native name: IDENTITY_URL_RESTORE_WIZARD
     * @type {Integer (Int32)}
     */
    static RESTORE_WIZARD => 5

    /**
     * Native name: IDENTITY_URL_CONNECT_WIZARD
     * @type {Integer (Int32)}
     */
    static CONNECT_WIZARD => 6
}
