#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The LOGPALETTE structure defines a logical palette.
 * @remarks
 * The colors in the palette-entry table should appear in order of importance because entries earlier in the logical palette are most likely to be placed in the system palette.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logpalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct LOGPALETTE {
    #StructPack 2

    /**
     * The version number of the system.
     */
    palVersion : UInt16

    /**
     * The number of entries in the logical palette.
     */
    palNumEntries : UInt16

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures that define the color and usage of each entry in the logical palette.
     */
    palPalEntry : PALETTEENTRY[1]

}
