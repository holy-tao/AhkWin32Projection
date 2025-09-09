#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTS.ahk

/**
 * The EMRPOLYLINE16, EMRPOLYBEZIER16, EMRPOLYGON16, EMRPOLYBEZIERTO16, and EMRPOLYLINETO16 structures contain members for the Polyline, PolyBezier, Polygon, PolyBezierTo, and PolylineTo enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolyline16
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPOLYLINE16 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(this.ptr + 8)
            return this.__rclBounds
        }
    }

    /**
     * Number of points in the array.
     * @type {Integer}
     */
    cpts {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of 16-bit points, in logical units.
     * @type {Array<POINTS>}
     */
    apts{
        get {
            if(!this.HasProp("__aptsProxyArray"))
                this.__aptsProxyArray := Win32FixedArray(this.ptr + 32, 1, POINTS, "")
            return this.__aptsProxyArray
        }
    }
}
