#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTS.ahk" { POINTS }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRPOLYPOLYLINE16 and EMRPOLYPOLYGON16 structures contain members for the PolyPolyline and PolyPolygon enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolypolyline16
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRPOLYPOLYLINE16 {
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
    cpts : UInt32

    /**
     * An array of point counts for each poly.
     */
    aPolyCounts : UInt32[1]

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structures, representing the points in logical units.
     */
    apts : POINTS[1]

}
