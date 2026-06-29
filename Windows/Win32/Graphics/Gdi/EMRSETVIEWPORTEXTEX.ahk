#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The EMRSETVIEWPORTEXTEX and EMRSETWINDOWEXTEX structures contains members for the SetViewportExtEx and SetWindowExtEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetviewportextex
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETVIEWPORTEXTEX {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Horizontal and vertical extents. For <b>SetViewportExtEx</b>, the extents are in device units, and for <b>SetWindowExtEx</b>, the extents are in logical units.
     */
    szlExtent : SIZE

}
