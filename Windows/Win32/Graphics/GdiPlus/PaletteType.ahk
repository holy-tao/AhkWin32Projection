#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct PaletteType {
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
    static PaletteTypeCustom => 0

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeOptimal => 1

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedBW => 2

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone27 => 4

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone125 => 6

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone216 => 7

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone252 => 8

    /**
     * @type {Integer (Int32)}
     */
    static PaletteTypeFixedHalftone256 => 9
}
