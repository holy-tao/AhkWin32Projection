#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSpellCheck extends Win32Enum {

    /**
     * Native name: htmlSpellCheckNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlSpellCheckTrue
     * @type {Integer (Int32)}
     */
    static True => 1

    /**
     * Native name: htmlSpellCheckFalse
     * @type {Integer (Int32)}
     */
    static False => 2

    /**
     * Native name: htmlSpellCheckDefault
     * @type {Integer (Int32)}
     */
    static Default => 3

    /**
     * Native name: htmlSpellCheck_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
