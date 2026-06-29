#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRLINETO and EMRMOVETOEX structures contains members for the LineTo and MoveToEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrlineto
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRLINETO {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Coordinates of the line's ending point for the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-lineto">LineTo</a> function or coordinates of the new current position for the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-movetoex">MoveToEx</a> function in logical units.
     */
    ptl : POINTL

}
