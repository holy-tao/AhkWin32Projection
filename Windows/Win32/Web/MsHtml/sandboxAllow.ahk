#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class sandboxAllow extends Win32Enum {

    /**
     * Native name: sandboxAllowScripts
     * @type {Integer (Int32)}
     */
    static Scripts => 0

    /**
     * Native name: sandboxAllowSameOrigin
     * @type {Integer (Int32)}
     */
    static SameOrigin => 1

    /**
     * Native name: sandboxAllowTopNavigation
     * @type {Integer (Int32)}
     */
    static TopNavigation => 2

    /**
     * Native name: sandboxAllowForms
     * @type {Integer (Int32)}
     */
    static Forms => 3

    /**
     * Native name: sandboxAllowPopups
     * @type {Integer (Int32)}
     */
    static Popups => 4

    /**
     * Native name: sandboxAllow_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
