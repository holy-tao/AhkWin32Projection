#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PAINT_TYPE extends Win32Enum {

    /**
     * Native name: DWRITE_PAINT_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DWRITE_PAINT_TYPE_LAYERS
     * @type {Integer (Int32)}
     */
    static LAYERS => 1

    /**
     * Native name: DWRITE_PAINT_TYPE_SOLID_GLYPH
     * @type {Integer (Int32)}
     */
    static SOLID_GLYPH => 2

    /**
     * Native name: DWRITE_PAINT_TYPE_SOLID
     * @type {Integer (Int32)}
     */
    static SOLID => 3

    /**
     * Native name: DWRITE_PAINT_TYPE_LINEAR_GRADIENT
     * @type {Integer (Int32)}
     */
    static LINEAR_GRADIENT => 4

    /**
     * Native name: DWRITE_PAINT_TYPE_RADIAL_GRADIENT
     * @type {Integer (Int32)}
     */
    static RADIAL_GRADIENT => 5

    /**
     * Native name: DWRITE_PAINT_TYPE_SWEEP_GRADIENT
     * @type {Integer (Int32)}
     */
    static SWEEP_GRADIENT => 6

    /**
     * Native name: DWRITE_PAINT_TYPE_GLYPH
     * @type {Integer (Int32)}
     */
    static GLYPH => 7

    /**
     * Native name: DWRITE_PAINT_TYPE_COLOR_GLYPH
     * @type {Integer (Int32)}
     */
    static COLOR_GLYPH => 8

    /**
     * Native name: DWRITE_PAINT_TYPE_TRANSFORM
     * @type {Integer (Int32)}
     */
    static TRANSFORM => 9

    /**
     * Native name: DWRITE_PAINT_TYPE_COMPOSITE
     * @type {Integer (Int32)}
     */
    static COMPOSITE => 10
}
