#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRPOLYDRAW structure contains members for the PolyDraw enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolydraw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPOLYDRAW extends Win32Struct
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
                this.__emr := EMR(this.ptr + 0)
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
                this.__rclBounds := RECTL(this.ptr + 8)
            return this.__rclBounds
        }
    }

    /**
     * The number of points.
     * @type {Integer}
     */
    cptl {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structures, representing the data points in logical units.
     * @type {Array<POINTL>}
     */
    aptl{
        get {
            if(!this.HasProp("__aptlProxyArray"))
                this.__aptlProxyArray := Win32FixedArray(this.ptr + 32, 1, POINTL, "")
            return this.__aptlProxyArray
        }
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    abTypes{
        get {
            if(!this.HasProp("__abTypesProxyArray"))
                this.__abTypesProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__abTypesProxyArray
        }
    }
}
