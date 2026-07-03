#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMREOF structure contains data for the enhanced metafile record that indicates the end of the metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emreof
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREOF {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The number of palette entries.
     */
    nPalEntries : UInt32

    /**
     * The offset, in bytes, to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures.
     */
    offPalEntries : UInt32

    /**
     * The same size as the <b>nSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emr">EMR</a> structure. This member must be the last double word of the record. If palette entries exist, they precede this member.
     */
    nSizeLast : UInt32

}
