#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRCOLORCORRECTPALETTE structure contains members for the ColorCorrectPalette enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcolorcorrectpalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRCOLORCORRECTPALETTE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The index of the palette handle to color correct.
     */
    ihPalette : UInt32

    /**
     * The index of the first entry in the palette to color correct.
     */
    nFirstEntry : UInt32

    /**
     * The number of palette entries to color correct.
     */
    nPalEntries : UInt32

    /**
     * Reserved.
     */
    nReserved : UInt32

}
