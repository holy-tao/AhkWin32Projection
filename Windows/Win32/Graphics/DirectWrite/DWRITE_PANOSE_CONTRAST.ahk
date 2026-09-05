#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_CONTRAST enumeration contains values that specify the ratio between thickest and thinnest point of the stroke for a letter such as uppercase 'O'.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_contrast
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_CONTRAST extends Win32Enum {

    /**
     * Any contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * No contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Very low contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_VERY_LOW
     * @type {Integer (Int32)}
     */
    static VERY_LOW => 3

    /**
     * Low contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 4

    /**
     * Medium low contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_MEDIUM_LOW
     * @type {Integer (Int32)}
     */
    static MEDIUM_LOW => 5

    /**
     * Medium contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 6

    /**
     * Medium high contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_MEDIUM_HIGH
     * @type {Integer (Int32)}
     */
    static MEDIUM_HIGH => 7

    /**
     * High contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 8

    /**
     * Very high contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_VERY_HIGH
     * @type {Integer (Int32)}
     */
    static VERY_HIGH => 9

    /**
     * Horizontal low contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_HORIZONTAL_LOW
     * @type {Integer (Int32)}
     */
    static HORIZONTAL_LOW => 10

    /**
     * Horizontal medium contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_HORIZONTAL_MEDIUM
     * @type {Integer (Int32)}
     */
    static HORIZONTAL_MEDIUM => 11

    /**
     * Horizontal high contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_HORIZONTAL_HIGH
     * @type {Integer (Int32)}
     */
    static HORIZONTAL_HIGH => 12

    /**
     * Broken contrast.
     * Native name: DWRITE_PANOSE_CONTRAST_BROKEN
     * @type {Integer (Int32)}
     */
    static BROKEN => 13
}
