#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_CONTRAST enumeration contains values that specify the ratio between thickest and thinnest point of the stroke for a letter such as uppercase 'O'.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_contrast
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_CONTRAST{

    /**
     * Any contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_ANY => 0

    /**
     * No fit contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_NO_FIT => 1

    /**
     * No contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_NONE => 2

    /**
     * Very low contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_VERY_LOW => 3

    /**
     * Low contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_LOW => 4

    /**
     * Medium low contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_MEDIUM_LOW => 5

    /**
     * Medium contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_MEDIUM => 6

    /**
     * Medium high contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_MEDIUM_HIGH => 7

    /**
     * High contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_HIGH => 8

    /**
     * Very high contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_VERY_HIGH => 9

    /**
     * Horizontal low contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_HORIZONTAL_LOW => 10

    /**
     * Horizontal medium contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_HORIZONTAL_MEDIUM => 11

    /**
     * Horizontal high contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_HORIZONTAL_HIGH => 12

    /**
     * Broken contrast.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_CONTRAST_BROKEN => 13
}
