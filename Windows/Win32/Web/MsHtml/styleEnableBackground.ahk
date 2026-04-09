#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleEnableBackground extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleEnableBackgroundNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleEnableBackgroundAccumulate => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleEnableBackgroundNew => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleEnableBackgroundInherit => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleEnableBackground_Max => 2147483647
}
