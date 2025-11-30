#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_PROPORTION enumeration contains values that specify the proportion of the glyph shape by considering additional detail to standard characters.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_proportion
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_PROPORTION extends Win32Enum{

    /**
     * Any proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_ANY => 0

    /**
     * No fit proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_NO_FIT => 1

    /**
     * Old style proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_OLD_STYLE => 2

    /**
     * Modern proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_MODERN => 3

    /**
     * Extra width proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_EVEN_WIDTH => 4

    /**
     * Expanded proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_EXPANDED => 5

    /**
     * Condensed proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_CONDENSED => 6

    /**
     * Very expanded proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_VERY_EXPANDED => 7

    /**
     * Very condensed proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_VERY_CONDENSED => 8

    /**
     * Monospaced proportion for the text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_PROPORTION_MONOSPACED => 9
}
