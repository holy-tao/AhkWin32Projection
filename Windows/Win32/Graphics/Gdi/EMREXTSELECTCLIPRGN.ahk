#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMREXTSELECTCLIPRGN structure contains members for the ExtSelectClipRgn enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextselectcliprgn
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREXTSELECTCLIPRGN extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

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
     * Size of region data, in bytes.
     * @type {Integer}
     */
    cbRgnData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    iMode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     * @type {Array<Byte>}
     */
    RgnData{
        get {
            if(!this.HasProp("__RgnDataProxyArray"))
                this.__RgnDataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__RgnDataProxyArray
        }
    }
}
