#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_BASELINE enumeration contains values that specify the baseline for text alignment.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_baseline
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_BASELINE extends Win32Enum {

    /**
     * The Roman baseline for horizontal; the Central baseline for vertical.
     * Native name: DWRITE_BASELINE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The baseline that is used by alphabetic scripts such as Latin, Greek, and Cyrillic.
     * Native name: DWRITE_BASELINE_ROMAN
     * @type {Integer (Int32)}
     */
    static ROMAN => 1

    /**
     * Central baseline, which is generally used for vertical text.
     * Native name: DWRITE_BASELINE_CENTRAL
     * @type {Integer (Int32)}
     */
    static CENTRAL => 2

    /**
     * Mathematical baseline, which math characters are centered on.
     * Native name: DWRITE_BASELINE_MATH
     * @type {Integer (Int32)}
     */
    static MATH => 3

    /**
     * Hanging baseline, which is used in scripts like Devanagari.
     * Native name: DWRITE_BASELINE_HANGING
     * @type {Integer (Int32)}
     */
    static HANGING => 4

    /**
     * Ideographic bottom baseline for CJK, left in vertical.
     * Native name: DWRITE_BASELINE_IDEOGRAPHIC_BOTTOM
     * @type {Integer (Int32)}
     */
    static IDEOGRAPHIC_BOTTOM => 5

    /**
     * Ideographic top baseline for CJK, right in vertical.
     * Native name: DWRITE_BASELINE_IDEOGRAPHIC_TOP
     * @type {Integer (Int32)}
     */
    static IDEOGRAPHIC_TOP => 6

    /**
     * The bottom-most extent in horizontal, left-most in vertical.
     * Native name: DWRITE_BASELINE_MINIMUM
     * @type {Integer (Int32)}
     */
    static MINIMUM => 7

    /**
     * The top-most extent in horizontal, right-most in vertical.
     * Native name: DWRITE_BASELINE_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 8
}
