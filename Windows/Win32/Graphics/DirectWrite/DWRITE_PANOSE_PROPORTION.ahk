#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_PROPORTION enumeration contains values that specify the proportion of the glyph shape by considering additional detail to standard characters.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_proportion
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_PROPORTION extends Win32Enum {

    /**
     * Any proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Old style proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_OLD_STYLE
     * @type {Integer (Int32)}
     */
    static OLD_STYLE => 2

    /**
     * Modern proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_MODERN
     * @type {Integer (Int32)}
     */
    static MODERN => 3

    /**
     * Extra width proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_EVEN_WIDTH
     * @type {Integer (Int32)}
     */
    static EVEN_WIDTH => 4

    /**
     * Expanded proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_EXPANDED
     * @type {Integer (Int32)}
     */
    static EXPANDED => 5

    /**
     * Condensed proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_CONDENSED
     * @type {Integer (Int32)}
     */
    static CONDENSED => 6

    /**
     * Very expanded proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_VERY_EXPANDED
     * @type {Integer (Int32)}
     */
    static VERY_EXPANDED => 7

    /**
     * Very condensed proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_VERY_CONDENSED
     * @type {Integer (Int32)}
     */
    static VERY_CONDENSED => 8

    /**
     * Monospaced proportion for the text.
     * Native name: DWRITE_PANOSE_PROPORTION_MONOSPACED
     * @type {Integer (Int32)}
     */
    static MONOSPACED => 9
}
