#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The EMRSETPALETTEENTRIES structure contains members for the SetPaletteEntries enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetpaletteentries
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETPALETTEENTRIES {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Palette handle index.
     */
    ihPal : UInt32

    /**
     * Index of first entry to set.
     */
    iStart : UInt32

    /**
     * Number of entries.
     */
    cEntries : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures. Note that <b>peFlags</b> members in the structures do not contain any flags.
     */
    aPalEntries : PALETTEENTRY[1]

}
