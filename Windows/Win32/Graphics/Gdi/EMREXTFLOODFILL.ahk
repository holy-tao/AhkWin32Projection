#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMREXTFLOODFILL structure contains members for the ExtFloodFill enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextfloodfill
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXTFLOODFILL {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Coordinates, in logical units, where filling begins.
     */
    ptlStart : POINTL

    /**
     * Color of fill. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crColor : COLORREF

    /**
     * Type of fill operation to be performed. This member must be either the FLOODFILLBORDER or FLOODFILLSURFACE value.
     */
    iMode : UInt32

}
