#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRRESIZEPALETTE structure contains members for the ResizePalette enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrresizepalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRRESIZEPALETTE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index of the palette in the handle table.
     */
    ihPal : UInt32

    /**
     * Number of entries in palette after resizing.
     */
    cEntries : UInt32

}
