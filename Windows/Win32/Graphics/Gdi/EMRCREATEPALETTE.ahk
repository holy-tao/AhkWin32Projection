#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LOGPALETTE.ahk" { LOGPALETTE }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The EMRCREATEPALETTE structure contains members for the CreatePalette enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatepalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRCREATEPALETTE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index of palette in handle table.
     */
    ihPal : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure that contains information about the palette. Note that <b>peFlags</b> members in the <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures do not contain any flags.
     */
    lgpl : LOGPALETTE

}
