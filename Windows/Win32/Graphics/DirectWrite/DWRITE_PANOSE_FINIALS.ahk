#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_FINIALS enumeration contains values that specify how character ends and minuscule ascenders are treated.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_finials
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_FINIALS extends Win32Enum {

    /**
     * Any finials.
     * Native name: DWRITE_PANOSE_FINIALS_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for finials.
     * Native name: DWRITE_PANOSE_FINIALS_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * No loops.
     * Native name: DWRITE_PANOSE_FINIALS_NONE_NO_LOOPS
     * @type {Integer (Int32)}
     */
    static NONE_NO_LOOPS => 2

    /**
     * No closed loops.
     * Native name: DWRITE_PANOSE_FINIALS_NONE_CLOSED_LOOPS
     * @type {Integer (Int32)}
     */
    static NONE_CLOSED_LOOPS => 3

    /**
     * No open loops.
     * Native name: DWRITE_PANOSE_FINIALS_NONE_OPEN_LOOPS
     * @type {Integer (Int32)}
     */
    static NONE_OPEN_LOOPS => 4

    /**
     * Sharp with no loops.
     * Native name: DWRITE_PANOSE_FINIALS_SHARP_NO_LOOPS
     * @type {Integer (Int32)}
     */
    static SHARP_NO_LOOPS => 5

    /**
     * Sharp with closed loops.
     * Native name: DWRITE_PANOSE_FINIALS_SHARP_CLOSED_LOOPS
     * @type {Integer (Int32)}
     */
    static SHARP_CLOSED_LOOPS => 6

    /**
     * Sharp with open loops.
     * Native name: DWRITE_PANOSE_FINIALS_SHARP_OPEN_LOOPS
     * @type {Integer (Int32)}
     */
    static SHARP_OPEN_LOOPS => 7

    /**
     * Tapered with no loops.
     * Native name: DWRITE_PANOSE_FINIALS_TAPERED_NO_LOOPS
     * @type {Integer (Int32)}
     */
    static TAPERED_NO_LOOPS => 8

    /**
     * Tapered with closed loops.
     * Native name: DWRITE_PANOSE_FINIALS_TAPERED_CLOSED_LOOPS
     * @type {Integer (Int32)}
     */
    static TAPERED_CLOSED_LOOPS => 9

    /**
     * Tapered with open loops.
     * Native name: DWRITE_PANOSE_FINIALS_TAPERED_OPEN_LOOPS
     * @type {Integer (Int32)}
     */
    static TAPERED_OPEN_LOOPS => 10

    /**
     * Round with no loops.
     * Native name: DWRITE_PANOSE_FINIALS_ROUND_NO_LOOPS
     * @type {Integer (Int32)}
     */
    static ROUND_NO_LOOPS => 11

    /**
     * Round with closed loops.
     * Native name: DWRITE_PANOSE_FINIALS_ROUND_CLOSED_LOOPS
     * @type {Integer (Int32)}
     */
    static ROUND_CLOSED_LOOPS => 12

    /**
     * Round with open loops.
     * Native name: DWRITE_PANOSE_FINIALS_ROUND_OPEN_LOOPS
     * @type {Integer (Int32)}
     */
    static ROUND_OPEN_LOOPS => 13
}
