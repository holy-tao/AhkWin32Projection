#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_FAMILY enumeration contains values that specify the kind of typeface classification.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_family
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_FAMILY extends Win32Enum {

    /**
     * Any typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Text display typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_TEXT_DISPLAY
     * @type {Integer (Int32)}
     */
    static TEXT_DISPLAY => 2

    /**
     * Script (or hand written) typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_SCRIPT
     * @type {Integer (Int32)}
     */
    static SCRIPT => 3

    /**
     * Decorative typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_DECORATIVE
     * @type {Integer (Int32)}
     */
    static DECORATIVE => 4

    /**
     * Symbol typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_SYMBOL
     * @type {Integer (Int32)}
     */
    static SYMBOL => 5

    /**
     * Pictorial (or symbol) typeface classification.
     * Native name: DWRITE_PANOSE_FAMILY_PICTORIAL
     * @type {Integer (Int32)}
     */
    static PICTORIAL => 5
}
