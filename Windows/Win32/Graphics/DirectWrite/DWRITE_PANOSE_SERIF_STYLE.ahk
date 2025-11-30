#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SERIF_STYLE enumeration contains values that specify the appearance of the serif text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_serif_style
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SERIF_STYLE extends Win32Enum{

    /**
     * Any appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_ANY => 0

    /**
     * No fit appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_NO_FIT => 1

    /**
     * Cove appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_COVE => 2

    /**
     * Obtuse cove appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_OBTUSE_COVE => 3

    /**
     * Square cove appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_SQUARE_COVE => 4

    /**
     * Obtuse square cove appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SQUARE_COVE => 5

    /**
     * Square appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_SQUARE => 6

    /**
     * Thin appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_THIN => 7

    /**
     * Oval appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_OVAL => 8

    /**
     * Exaggerated appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_EXAGGERATED => 9

    /**
     * Triangle appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_TRIANGLE => 10

    /**
     * Normal sans appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_NORMAL_SANS => 11

    /**
     * Obtuse sans appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SANS => 12

    /**
     * Perpendicular sans appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_PERPENDICULAR_SANS => 13

    /**
     * Flared appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_FLARED => 14

    /**
     * Rounded appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_ROUNDED => 15

    /**
     * Script appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_SCRIPT => 16

    /**
     * Perpendicular sans appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_PERP_SANS => 13

    /**
     * Oval appearance of the serif text.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SERIF_STYLE_BONE => 8
}
