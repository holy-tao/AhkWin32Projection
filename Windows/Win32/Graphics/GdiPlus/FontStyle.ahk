#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FontStyle enumeration specifies the style of the typeface of a font. Styles can be combined.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-fontstyle
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FontStyle{

    /**
     * Specifies normal weight or thickness of the typeface.
     * @type {Integer (Int32)}
     */
    static FontStyleRegular => 0

    /**
     * Specifies bold typeface. Bold is a heavier weight or thickness.
     * @type {Integer (Int32)}
     */
    static FontStyleBold => 1

    /**
     * Specifies italic typeface, which produces a noticeable slant to the vertical stems of the characters.
     * @type {Integer (Int32)}
     */
    static FontStyleItalic => 2

    /**
     * Specifies the typeface as both bold and italic.
     * @type {Integer (Int32)}
     */
    static FontStyleBoldItalic => 3

    /**
     * Specifies underline, which displays a line underneath the baseline of the characters.
     * @type {Integer (Int32)}
     */
    static FontStyleUnderline => 4

    /**
     * Specifies strikeout, which displays a horizontal line drawn through the middle of the characters.
     * @type {Integer (Int32)}
     */
    static FontStyleStrikeout => 8
}
