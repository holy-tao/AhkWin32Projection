#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_XHEIGHT enumeration contains values that specify info about the relative size of lowercase letters and the treatment of diacritic marks (xheight).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_xheight
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_XHEIGHT extends Win32Enum{

    /**
     * Any xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_ANY => 0

    /**
     * No fit xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_NO_FIT => 1

    /**
     * Constant small xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_CONSTANT_SMALL => 2

    /**
     * Constant standard xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_CONSTANT_STANDARD => 3

    /**
     * Constant large xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_CONSTANT_LARGE => 4

    /**
     * Ducking small xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_DUCKING_SMALL => 5

    /**
     * Ducking standard xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_DUCKING_STANDARD => 6

    /**
     * Ducking large xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_DUCKING_LARGE => 7

    /**
     * Constant standard xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_CONSTANT_STD => 3

    /**
     * Ducking standard xheight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_XHEIGHT_DUCKING_STD => 6
}
