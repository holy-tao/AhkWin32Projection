#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSELECTPALETTE structure contains members for the SelectPalette enhanced metafile record. Note that the bForceBackground parameter in SelectPalette is always recorded as TRUE, which causes the palette to be realized as a background palette.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrselectpalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSELECTPALETTE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index to logical palette in the handle table.
     */
    ihPal : UInt32

}
