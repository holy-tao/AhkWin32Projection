#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\ENHANCED_METAFILE_RECORD_TYPE.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRPOLYPOLYLINE and EMRPOLYPOLYGON structures contain members for the PolyPolyline and PolyPolygon enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolypolyline
 * @namespace Windows.Win32.Graphics.Gdi
 */
class EMRPOLYPOLYLINE extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr {
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
    rclBounds {
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
     * @type {Array<Integer>}
     */
    aPolyCounts {
        get {
            if(!this.HasProp("__aPolyCountsProxyArray"))
                this.__aPolyCountsProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "uint")
            return this.__aPolyCountsProxyArray
        }
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structures, representing the points in logical units.
     * @type {POINTL}
     */
    aptl {
        get {
            if(!this.HasProp("__aptlProxyArray"))
                this.__aptlProxyArray := Win32FixedArray(this.ptr + 36, 1, POINTL, "")
            return this.__aptlProxyArray
        }
    }
}
