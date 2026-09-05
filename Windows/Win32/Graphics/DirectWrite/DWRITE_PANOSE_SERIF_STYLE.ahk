#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SERIF_STYLE enumeration contains values that specify the appearance of the serif text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_serif_style
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SERIF_STYLE extends Win32Enum {

    /**
     * Any appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Cove appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_COVE
     * @type {Integer (Int32)}
     */
    static COVE => 2

    /**
     * Obtuse cove appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_OBTUSE_COVE
     * @type {Integer (Int32)}
     */
    static OBTUSE_COVE => 3

    /**
     * Square cove appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_SQUARE_COVE
     * @type {Integer (Int32)}
     */
    static SQUARE_COVE => 4

    /**
     * Obtuse square cove appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SQUARE_COVE
     * @type {Integer (Int32)}
     */
    static OBTUSE_SQUARE_COVE => 5

    /**
     * Square appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_SQUARE
     * @type {Integer (Int32)}
     */
    static SQUARE => 6

    /**
     * Thin appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_THIN
     * @type {Integer (Int32)}
     */
    static THIN => 7

    /**
     * Oval appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_OVAL
     * @type {Integer (Int32)}
     */
    static OVAL => 8

    /**
     * Exaggerated appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_EXAGGERATED
     * @type {Integer (Int32)}
     */
    static EXAGGERATED => 9

    /**
     * Triangle appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_TRIANGLE
     * @type {Integer (Int32)}
     */
    static TRIANGLE => 10

    /**
     * Normal sans appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_NORMAL_SANS
     * @type {Integer (Int32)}
     */
    static NORMAL_SANS => 11

    /**
     * Obtuse sans appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SANS
     * @type {Integer (Int32)}
     */
    static OBTUSE_SANS => 12

    /**
     * Perpendicular sans appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_PERPENDICULAR_SANS
     * @type {Integer (Int32)}
     */
    static PERPENDICULAR_SANS => 13

    /**
     * Flared appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_FLARED
     * @type {Integer (Int32)}
     */
    static FLARED => 14

    /**
     * Rounded appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_ROUNDED
     * @type {Integer (Int32)}
     */
    static ROUNDED => 15

    /**
     * Script appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_SCRIPT
     * @type {Integer (Int32)}
     */
    static SCRIPT => 16

    /**
     * Perpendicular sans appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_PERP_SANS
     * @type {Integer (Int32)}
     */
    static PERP_SANS => 13

    /**
     * Oval appearance of the serif text.
     * Native name: DWRITE_PANOSE_SERIF_STYLE_BONE
     * @type {Integer (Int32)}
     */
    static BONE => 8
}
