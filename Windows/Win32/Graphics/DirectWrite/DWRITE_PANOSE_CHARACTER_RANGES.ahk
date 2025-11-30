#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_CHARACTER_RANGES enumeration contains values that specify the type of characters available in the font.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_character_ranges
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_CHARACTER_RANGES extends Win32Enum{

    /**
     * Any range.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_ANY => 0

    /**
     * No fit for range.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_NO_FIT => 1

    /**
     * The range includes extended collection.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_EXTENDED_COLLECTION => 2

    /**
     * The range includes literals.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_LITERALS => 3

    /**
     * The range doesn't include lower case.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_NO_LOWER_CASE => 4

    /**
     * The range includes small capitals.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CHARACTER_RANGES_SMALL_CAPS => 5
}
