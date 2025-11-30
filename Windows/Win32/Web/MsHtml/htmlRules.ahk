#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlRules extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesnone => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesgroups => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesrows => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulescols => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesall => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlRules_Max => 2147483647
}
