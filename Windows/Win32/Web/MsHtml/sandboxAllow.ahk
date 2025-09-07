#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class sandboxAllow{

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowScripts => 0

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowSameOrigin => 1

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowTopNavigation => 2

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowForms => 3

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowPopups => 4

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllow_Max => 2147483647
}
