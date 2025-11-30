#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PAINT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_LAYERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_SOLID_GLYPH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_SOLID => 3

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_LINEAR_GRADIENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_RADIAL_GRADIENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_SWEEP_GRADIENT => 6

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_GLYPH => 7

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_COLOR_GLYPH => 8

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_TRANSFORM => 9

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_TYPE_COMPOSITE => 10
}
