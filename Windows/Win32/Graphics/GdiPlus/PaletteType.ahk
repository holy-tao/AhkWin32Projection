#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PaletteType extends Win32Enum {

    /**
     * Native name: PaletteTypeCustom
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * Native name: PaletteTypeOptimal
     * @type {Integer (Int32)}
     */
    static Optimal => 1

    /**
     * Native name: PaletteTypeFixedBW
     * @type {Integer (Int32)}
     */
    static FixedBW => 2

    /**
     * Native name: PaletteTypeFixedHalftone8
     * @type {Integer (Int32)}
     */
    static FixedHalftone8 => 3

    /**
     * Native name: PaletteTypeFixedHalftone27
     * @type {Integer (Int32)}
     */
    static FixedHalftone27 => 4

    /**
     * Native name: PaletteTypeFixedHalftone64
     * @type {Integer (Int32)}
     */
    static FixedHalftone64 => 5

    /**
     * Native name: PaletteTypeFixedHalftone125
     * @type {Integer (Int32)}
     */
    static FixedHalftone125 => 6

    /**
     * Native name: PaletteTypeFixedHalftone216
     * @type {Integer (Int32)}
     */
    static FixedHalftone216 => 7

    /**
     * Native name: PaletteTypeFixedHalftone252
     * @type {Integer (Int32)}
     */
    static FixedHalftone252 => 8

    /**
     * Native name: PaletteTypeFixedHalftone256
     * @type {Integer (Int32)}
     */
    static FixedHalftone256 => 9
}
