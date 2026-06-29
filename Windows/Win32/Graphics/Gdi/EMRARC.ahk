#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRARC, EMRARCTO, EMRCHORD, and EMRPIE structures contain members for the Arc, ArcTo, Chord, and Pie enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrarc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRARC {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle in logical units.
     */
    rclBox : RECTL

    /**
     * Coordinates of first radial ending point in logical units.
     */
    ptlStart : POINTL

    /**
     * Coordinates of second radial ending point in logical units.
     */
    ptlEnd : POINTL

}
