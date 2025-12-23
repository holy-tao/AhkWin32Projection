#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_STROKE_VARIATION enumeration contains values that specify the relationship between thin and thick stems of text characters.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_stroke_variation
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_STROKE_VARIATION extends Win32Enum{

    /**
     * Any stroke variation for text characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_ANY => 0

    /**
     * No fit stroke variation for text characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_NO_FIT => 1

    /**
     * No stroke variation for text characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_NO_VARIATION => 2

    /**
     * The stroke variation for text characters is gradual diagonal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_DIAGONAL => 3

    /**
     * The stroke variation for text characters is gradual transitional.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_TRANSITIONAL => 4

    /**
     * The stroke variation for text characters is gradual vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_VERTICAL => 5

    /**
     * The stroke variation for text characters is gradual horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_HORIZONTAL => 6

    /**
     * The stroke variation for text characters is rapid vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_RAPID_VERTICAL => 7

    /**
     * The stroke variation for text characters is rapid horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_RAPID_HORIZONTAL => 8

    /**
     * The stroke variation for text characters is instant vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_INSTANT_VERTICAL => 9

    /**
     * The stroke variation for text characters is instant horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_STROKE_VARIATION_INSTANT_HORIZONTAL => 10
}
