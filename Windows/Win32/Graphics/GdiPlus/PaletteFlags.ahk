#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PaletteFlags extends Win32Enum {

    /**
     * Native name: PaletteFlagsHasAlpha
     * @type {Integer (Int32)}
     */
    static HasAlpha => 1

    /**
     * Native name: PaletteFlagsGrayScale
     * @type {Integer (Int32)}
     */
    static GrayScale => 2

    /**
     * Native name: PaletteFlagsHalftone
     * @type {Integer (Int32)}
     */
    static Halftone => 4
}
