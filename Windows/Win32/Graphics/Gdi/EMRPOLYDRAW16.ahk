#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\ENHANCED_METAFILE_RECORD_TYPE.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTS.ahk

/**
 * The EMRPOLYDRAW16 structure contains members for the PolyDraw enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolydraw16
 * @namespace Windows.Win32.Graphics.Gdi
 */
class EMRPOLYDRAW16 extends Win32Struct {
    static sizeof => 36

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
     * The number of points.
     * @type {Integer}
     */
    cpts {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structures, representing the data points in logical units.
     * @type {POINTS}
     */
    apts {
        get {
            if(!this.HasProp("__aptsProxyArray"))
                this.__aptsProxyArray := Win32FixedArray(this.ptr + 28, 1, POINTS, "")
            return this.__aptsProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    abTypes {
        get {
            if(!this.HasProp("__abTypesProxyArray"))
                this.__abTypesProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__abTypesProxyArray
        }
    }
}
