#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRPOLYPOLYLINE and EMRPOLYPOLYGON structures contain members for the PolyPolyline and PolyPolygon enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrpolypolyline
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPOLYPOLYLINE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * The bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(8, this)
            return this.__rclBounds
        }
    }

    /**
     * The number of polys.
     * @type {Integer}
     */
    nPolys {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The total number of points in all polys.
     * @type {Integer}
     */
    cptl {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * An array of point counts for each poly.
     * @type {Array<UInt32>}
     */
    aPolyCounts{
        get {
            if(!this.HasProp("__aPolyCountsProxyArray"))
                this.__aPolyCountsProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "uint")
            return this.__aPolyCountsProxyArray
        }
    }

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structures, representing the points in logical units.
     * @type {Array<POINTL>}
     */
    aptl{
        get {
            if(!this.HasProp("__aptlProxyArray"))
                this.__aptlProxyArray := Win32FixedArray(this.ptr + 40, 1, POINTL, "")
            return this.__aptlProxyArray
        }
    }
}
