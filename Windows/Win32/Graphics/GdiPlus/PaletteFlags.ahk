#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PaletteFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PaletteFlagsHasAlpha => 1

    /**
     * @type {Integer (Int32)}
     */
    static PaletteFlagsGrayScale => 2

    /**
     * @type {Integer (Int32)}
     */
    static PaletteFlagsHalftone => 4
}
