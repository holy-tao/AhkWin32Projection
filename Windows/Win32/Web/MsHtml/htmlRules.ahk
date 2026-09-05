#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlRules extends Win32Enum {

    /**
     * Native name: htmlRulesNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlRulesnone
     * @type {Integer (Int32)}
     */
    static Rulesnone => 1

    /**
     * Native name: htmlRulesgroups
     * @type {Integer (Int32)}
     */
    static Rulesgroups => 2

    /**
     * Native name: htmlRulesrows
     * @type {Integer (Int32)}
     */
    static Rulesrows => 3

    /**
     * Native name: htmlRulescols
     * @type {Integer (Int32)}
     */
    static Rulescols => 4

    /**
     * Native name: htmlRulesall
     * @type {Integer (Int32)}
     */
    static Rulesall => 5

    /**
     * Native name: htmlRules_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
