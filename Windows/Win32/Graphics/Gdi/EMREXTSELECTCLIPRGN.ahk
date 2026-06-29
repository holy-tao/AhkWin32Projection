#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMREXTSELECTCLIPRGN structure contains members for the ExtSelectClipRgn enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextselectcliprgn
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXTSELECTCLIPRGN {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Size of region data, in bytes.
     */
    cbRgnData : UInt32

    iMode : UInt32

    /**
     * Buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     */
    RgnData : Int8[1]

}
