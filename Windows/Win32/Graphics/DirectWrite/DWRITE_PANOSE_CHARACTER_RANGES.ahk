#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_PANOSE_CHARACTER_RANGES enumeration contains values that specify the type of characters available in the font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_character_ranges
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PANOSE_CHARACTER_RANGES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
