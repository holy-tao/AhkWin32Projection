#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_XASCENT enumeration contains values that specify the relative size of the lowercase letters.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_xascent
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_XASCENT{

    /**
     * Any xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_ANY => 0

    /**
     * No fit for xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_NO_FIT => 1

    /**
     * Very low xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_VERY_LOW => 2

    /**
     * Low xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_LOW => 3

    /**
     * Medium xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_MEDIUM => 4

    /**
     * High xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_HIGH => 5

    /**
     * Very high xascent.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XASCENT_VERY_HIGH => 6
}
