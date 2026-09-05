#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleEnableBackground extends Win32Enum {

    /**
     * Native name: styleEnableBackgroundNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleEnableBackgroundAccumulate
     * @type {Integer (Int32)}
     */
    static Accumulate => 1

    /**
     * Native name: styleEnableBackgroundNew
     * @type {Integer (Int32)}
     */
    static New => 2

    /**
     * Native name: styleEnableBackgroundInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 3

    /**
     * Native name: styleEnableBackground_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
