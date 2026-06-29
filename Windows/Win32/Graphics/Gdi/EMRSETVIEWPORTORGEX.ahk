#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETVIEWPORTORGEX, EMRSETWINDOWORGEX, and EMRSETBRUSHORGEX structures contain members for the SetViewportOrgEx, SetWindowOrgEx, and SetBrushOrgEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetviewportorgex
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETVIEWPORTORGEX {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Coordinates of the origin. For <b>EMRSETVIEWPORTORGEX</b> and <b>EMRSETBRUSHORGEX</b>, this is in device units. For <b>EMRSETWINDOWORGEX</b>, this is in logical units.
     */
    ptlOrigin : POINTL

}
