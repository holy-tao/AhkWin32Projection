#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLineBreak extends Win32Enum {

    /**
     * Native name: styleLineBreakNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleLineBreakNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: styleLineBreakStrict
     * @type {Integer (Int32)}
     */
    static Strict => 2

    /**
     * Native name: styleLineBreak_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
