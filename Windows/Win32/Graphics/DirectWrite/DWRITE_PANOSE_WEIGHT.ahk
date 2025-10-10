#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_WEIGHT enumeration contains values that specify the weight of characters.
 * @remarks
 * 
  * The <b>DWRITE_PANOSE_WEIGHT</b> values roughly correspond to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a> values by using (panose_weight - 2) * 100 = font_weight.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_weight
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_WEIGHT{

    /**
     * Any weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_ANY => 0

    /**
     * No fit weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_NO_FIT => 1

    /**
     * Very light weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_VERY_LIGHT => 2

    /**
     * Light weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_LIGHT => 3

    /**
     * Thin weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_THIN => 4

    /**
     * Book weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_BOOK => 5

    /**
     * Medium weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_MEDIUM => 6

    /**
     * Demi weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_DEMI => 7

    /**
     * Bold weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_BOLD => 8

    /**
     * Heavy weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_HEAVY => 9

    /**
     * Black weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_BLACK => 10

    /**
     * Extra black weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_EXTRA_BLACK => 11

    /**
     * Extra black weight.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_WEIGHT_NORD => 11
}
