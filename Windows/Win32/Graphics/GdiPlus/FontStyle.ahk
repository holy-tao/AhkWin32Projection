#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FontStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleRegular => 0

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleBold => 1

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleItalic => 2

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleBoldItalic => 3

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleUnderline => 4

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleStrikeout => 8
}
