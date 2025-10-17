#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The EMRFRAMERGN structure contains members for the FrameRgn enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrframergn
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRFRAMERGN extends Win32Struct
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
     * Bounding rectangle, in device units.
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
     * Size of region data, in bytes.
     * @type {Integer}
     */
    cbRgnData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Index of brush, in handle table.
     * @type {Integer}
     */
    ihBrush {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Width and height of region frame, in logical units.
     * @type {SIZE}
     */
    szlStroke{
        get {
            if(!this.HasProp("__szlStroke"))
                this.__szlStroke := SIZE(32, this)
            return this.__szlStroke
        }
    }

    /**
     * Buffer containing <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     * @type {Array<Byte>}
     */
    RgnData{
        get {
            if(!this.HasProp("__RgnDataProxyArray"))
                this.__RgnDataProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__RgnDataProxyArray
        }
    }
}
