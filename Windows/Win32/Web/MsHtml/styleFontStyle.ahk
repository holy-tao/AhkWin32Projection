#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleFontStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleItalic => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleOblique => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleNormal => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyle_Max => 2147483647
}
