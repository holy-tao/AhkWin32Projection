#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFontStyle extends Win32Enum {

    /**
     * Native name: styleFontStyleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleFontStyleItalic
     * @type {Integer (Int32)}
     */
    static Italic => 1

    /**
     * Native name: styleFontStyleOblique
     * @type {Integer (Int32)}
     */
    static Oblique => 2

    /**
     * Native name: styleFontStyleNormal
     * @type {Integer (Int32)}
     */
    static Normal => 3

    /**
     * Native name: styleFontStyle_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
