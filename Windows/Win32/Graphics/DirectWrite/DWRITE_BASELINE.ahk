#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_BASELINE enumeration contains values that specify the baseline for text alignment.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_baseline
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_BASELINE{

    /**
     * The Roman baseline for horizontal; the Central baseline for vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_DEFAULT => 0

    /**
     * The baseline that is used by alphabetic scripts such as Latin, Greek, and Cyrillic.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_ROMAN => 1

    /**
     * Central baseline, which is generally used for vertical text.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_CENTRAL => 2

    /**
     * Mathematical baseline, which math characters are centered on.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_MATH => 3

    /**
     * Hanging baseline, which is used in scripts like Devanagari.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_HANGING => 4

    /**
     * Ideographic bottom baseline for CJK, left in vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_IDEOGRAPHIC_BOTTOM => 5

    /**
     * Ideographic top baseline for CJK, right in vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_IDEOGRAPHIC_TOP => 6

    /**
     * The bottom-most extent in horizontal, left-most in vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_MINIMUM => 7

    /**
     * The top-most extent in horizontal, right-most in vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_BASELINE_MAXIMUM => 8
}
