#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRPOLYPOLYLINE and EMRPOLYPOLYGON structures contain members for the PolyPolyline and PolyPolygon enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolypolyline
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRPOLYPOLYLINE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The bounding rectangle, in device units.
     */
    rclBounds : RECTL

    /**
     * The number of polys.
     */
    nPolys : UInt32

    /**
     * The total number of points in all polys.
     */
    cptl : UInt32

    /**
     * An array of point counts for each poly.
     */
    aPolyCounts : UInt32[1]

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structures, representing the points in logical units.
     */
    aptl : POINTL[1]

}
