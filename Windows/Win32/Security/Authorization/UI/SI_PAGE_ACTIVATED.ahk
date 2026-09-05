#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 */
class SI_PAGE_ACTIVATED extends Win32Enum {

    /**
     * Native name: SI_SHOW_DEFAULT
     * @type {Integer (Int32)}
     */
    static SHOW_DEFAULT => 0

    /**
     * Native name: SI_SHOW_PERM_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_PERM_ACTIVATED => 1

    /**
     * Native name: SI_SHOW_AUDIT_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_AUDIT_ACTIVATED => 2

    /**
     * Native name: SI_SHOW_OWNER_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_OWNER_ACTIVATED => 3

    /**
     * Native name: SI_SHOW_EFFECTIVE_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_EFFECTIVE_ACTIVATED => 4

    /**
     * Native name: SI_SHOW_SHARE_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_SHARE_ACTIVATED => 5

    /**
     * Native name: SI_SHOW_CENTRAL_POLICY_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SHOW_CENTRAL_POLICY_ACTIVATED => 6
}
