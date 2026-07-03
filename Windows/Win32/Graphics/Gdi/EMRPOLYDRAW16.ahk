#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTS.ahk" { POINTS }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRPOLYDRAW16 structure contains members for the PolyDraw enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolydraw16
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRPOLYDRAW16 {
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
     * The number of points.
     */
    cpts : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structures, representing the data points in logical units.
     */
    apts : POINTS[1]

    abTypes : Int8[1]

}
