#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_WEIGHT enumeration contains values that specify the weight of characters.
 * @remarks
 * The <b>DWRITE_PANOSE_WEIGHT</b> values roughly correspond to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a> values by using (panose_weight - 2) * 100 = font_weight.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_weight
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_WEIGHT extends Win32Enum {

    /**
     * Any weight.
     * Native name: DWRITE_PANOSE_WEIGHT_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit weight.
     * Native name: DWRITE_PANOSE_WEIGHT_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Very light weight.
     * Native name: DWRITE_PANOSE_WEIGHT_VERY_LIGHT
     * @type {Integer (Int32)}
     */
    static VERY_LIGHT => 2

    /**
     * Light weight.
     * Native name: DWRITE_PANOSE_WEIGHT_LIGHT
     * @type {Integer (Int32)}
     */
    static LIGHT => 3

    /**
     * Thin weight.
     * Native name: DWRITE_PANOSE_WEIGHT_THIN
     * @type {Integer (Int32)}
     */
    static THIN => 4

    /**
     * Book weight.
     * Native name: DWRITE_PANOSE_WEIGHT_BOOK
     * @type {Integer (Int32)}
     */
    static BOOK => 5

    /**
     * Medium weight.
     * Native name: DWRITE_PANOSE_WEIGHT_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 6

    /**
     * Demi weight.
     * Native name: DWRITE_PANOSE_WEIGHT_DEMI
     * @type {Integer (Int32)}
     */
    static DEMI => 7

    /**
     * Bold weight.
     * Native name: DWRITE_PANOSE_WEIGHT_BOLD
     * @type {Integer (Int32)}
     */
    static BOLD => 8

    /**
     * Heavy weight.
     * Native name: DWRITE_PANOSE_WEIGHT_HEAVY
     * @type {Integer (Int32)}
     */
    static HEAVY => 9

    /**
     * Black weight.
     * Native name: DWRITE_PANOSE_WEIGHT_BLACK
     * @type {Integer (Int32)}
     */
    static BLACK => 10

    /**
     * Extra black weight.
     * Native name: DWRITE_PANOSE_WEIGHT_EXTRA_BLACK
     * @type {Integer (Int32)}
     */
    static EXTRA_BLACK => 11

    /**
     * Extra black weight.
     * Native name: DWRITE_PANOSE_WEIGHT_NORD
     * @type {Integer (Int32)}
     */
    static NORD => 11
}
