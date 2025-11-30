#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_FAMILY enumeration contains values that specify the kind of typeface classification.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_family
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_FAMILY extends Win32Enum{

    /**
     * Any typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_ANY => 0

    /**
     * No fit typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_NO_FIT => 1

    /**
     * Text display typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_TEXT_DISPLAY => 2

    /**
     * Script (or hand written) typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_SCRIPT => 3

    /**
     * Decorative typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_DECORATIVE => 4

    /**
     * Symbol typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_SYMBOL => 5

    /**
     * Pictorial (or symbol) typeface classification.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FAMILY_PICTORIAL => 5
}
