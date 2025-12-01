#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTS.ahk

/**
 * The EMRPOLYPOLYLINE16 and EMRPOLYPOLYGON16 structures contain members for the PolyPolyline and PolyPolygon enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolypolyline16
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPOLYPOLYLINE16 extends Win32Struct
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
    cpts {
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
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structures, representing the points in logical units.
     * @type {Array<POINTS>}
     */
    apts{
        get {
            if(!this.HasProp("__aptsProxyArray"))
                this.__aptsProxyArray := Win32FixedArray(this.ptr + 40, 1, POINTS, "")
            return this.__aptsProxyArray
        }
    }
}
