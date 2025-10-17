#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRINVERTRGN and EMRPAINTRGN structures contain members for the InvertRgn and PaintRgn enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrinvertrgn
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRINVERTRGN extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Base structure for all record types.
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
     * Buffer containing an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     * @type {Array<Byte>}
     */
    RgnData{
        get {
            if(!this.HasProp("__RgnDataProxyArray"))
                this.__RgnDataProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__RgnDataProxyArray
        }
    }
}
