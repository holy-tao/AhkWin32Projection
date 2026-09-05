#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_XHEIGHT enumeration contains values that specify info about the relative size of lowercase letters and the treatment of diacritic marks (xheight).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_xheight
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_XHEIGHT extends Win32Enum {

    /**
     * Any xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Constant small xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_CONSTANT_SMALL
     * @type {Integer (Int32)}
     */
    static CONSTANT_SMALL => 2

    /**
     * Constant standard xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_CONSTANT_STANDARD
     * @type {Integer (Int32)}
     */
    static CONSTANT_STANDARD => 3

    /**
     * Constant large xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_CONSTANT_LARGE
     * @type {Integer (Int32)}
     */
    static CONSTANT_LARGE => 4

    /**
     * Ducking small xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_DUCKING_SMALL
     * @type {Integer (Int32)}
     */
    static DUCKING_SMALL => 5

    /**
     * Ducking standard xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_DUCKING_STANDARD
     * @type {Integer (Int32)}
     */
    static DUCKING_STANDARD => 6

    /**
     * Ducking large xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_DUCKING_LARGE
     * @type {Integer (Int32)}
     */
    static DUCKING_LARGE => 7

    /**
     * Constant standard xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_CONSTANT_STD
     * @type {Integer (Int32)}
     */
    static CONSTANT_STD => 3

    /**
     * Ducking standard xheight.
     * Native name: DWRITE_PANOSE_XHEIGHT_DUCKING_STD
     * @type {Integer (Int32)}
     */
    static DUCKING_STD => 6
}
