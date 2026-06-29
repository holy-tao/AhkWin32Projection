#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PAINT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
