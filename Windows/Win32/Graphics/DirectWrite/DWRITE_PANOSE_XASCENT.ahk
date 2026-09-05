#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_XASCENT enumeration contains values that specify the relative size of the lowercase letters.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_xascent
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_XASCENT extends Win32Enum {

    /**
     * Any xascent.
     * Native name: DWRITE_PANOSE_XASCENT_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for xascent.
     * Native name: DWRITE_PANOSE_XASCENT_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Very low xascent.
     * Native name: DWRITE_PANOSE_XASCENT_VERY_LOW
     * @type {Integer (Int32)}
     */
    static VERY_LOW => 2

    /**
     * Low xascent.
     * Native name: DWRITE_PANOSE_XASCENT_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 3

    /**
     * Medium xascent.
     * Native name: DWRITE_PANOSE_XASCENT_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 4

    /**
     * High xascent.
     * Native name: DWRITE_PANOSE_XASCENT_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 5

    /**
     * Very high xascent.
     * Native name: DWRITE_PANOSE_XASCENT_VERY_HIGH
     * @type {Integer (Int32)}
     */
    static VERY_HIGH => 6
}
