#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PaletteFlags enumeration indicates attributes of the color data in a palette.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluspixelformats/ne-gdipluspixelformats-paletteflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PaletteFlags{

    /**
     * Indicates that one or more of the palette entries contains alpha (transparency) information.
     * @type {Integer (Int32)}
     */
    static PaletteFlagsHasAlpha => 1

    /**
     * Indicates that the palette contains only grayscale entries.
     * @type {Integer (Int32)}
     */
    static PaletteFlagsGrayScale => 2

    /**
     * Indicates that the palette is the Windows halftone palette.
     * @type {Integer (Int32)}
     */
    static PaletteFlagsHalftone => 4
}
