#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRFILLRGN structure contains members for the FillRgn enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrfillrgn
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRFILLRGN extends Win32Struct
{
    static sizeof => 40

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
     * Buffer containing <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     * @type {Array<Byte>}
     */
    RgnData{
        get {
            if(!this.HasProp("__RgnDataProxyArray"))
                this.__RgnDataProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__RgnDataProxyArray
        }
    }
}
