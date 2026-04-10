#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSpellCheck extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckTrue => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckFalse => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckDefault => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheck_Max => 2147483647
}
