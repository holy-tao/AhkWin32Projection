#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class FontStyle extends Win32Enum {

    /**
     * Native name: FontStyleRegular
     * @type {Integer (Int32)}
     */
    static Regular => 0

    /**
     * Native name: FontStyleBold
     * @type {Integer (Int32)}
     */
    static Bold => 1

    /**
     * Native name: FontStyleItalic
     * @type {Integer (Int32)}
     */
    static Italic => 2

    /**
     * Native name: FontStyleBoldItalic
     * @type {Integer (Int32)}
     */
    static BoldItalic => 3

    /**
     * Native name: FontStyleUnderline
     * @type {Integer (Int32)}
     */
    static Underline => 4

    /**
     * Native name: FontStyleStrikeout
     * @type {Integer (Int32)}
     */
    static Strikeout => 8
}
