#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMROFFSETCLIPRGN structure contains members for the OffsetClipRgn enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emroffsetcliprgn
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMROFFSETCLIPRGN {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The logical coordinates of offset.
     */
    ptlOffset : POINTL

}
