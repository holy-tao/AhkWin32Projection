#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_CHARACTER_RANGES enumeration contains values that specify the type of characters available in the font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_character_ranges
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_CHARACTER_RANGES extends Win32Enum {

    /**
     * Any range.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for range.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * The range includes extended collection.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_EXTENDED_COLLECTION
     * @type {Integer (Int32)}
     */
    static EXTENDED_COLLECTION => 2

    /**
     * The range includes literals.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_LITERALS
     * @type {Integer (Int32)}
     */
    static LITERALS => 3

    /**
     * The range doesn't include lower case.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_NO_LOWER_CASE
     * @type {Integer (Int32)}
     */
    static NO_LOWER_CASE => 4

    /**
     * The range includes small capitals.
     * Native name: DWRITE_PANOSE_CHARACTER_RANGES_SMALL_CAPS
     * @type {Integer (Int32)}
     */
    static SMALL_CAPS => 5
}
