#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\COLORREF.ahk
#Include .\EXTLOGPEN32.ahk

/**
 * The EMREXTCREATEPEN structure contains members for the ExtCreatePen enhanced metafile record. If the record contains a BITMAPINFO structure, it is followed by the bitmap bits that form a packed device-independent bitmap (DIB).
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrextcreatepen
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREXTCREATEPEN extends Win32Struct
{
    static sizeof => 64

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
     * Index to pen in handle table.
     * @type {Integer}
     */
    ihPen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Offset to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure, if any.
     * @type {Integer}
     */
    offBmi {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure, if any.
     * @type {Integer}
     */
    cbBmi {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset to brush bitmap bits, if any.
     * @type {Integer}
     */
    offBits {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of brush bitmap bits, if any.
     * @type {Integer}
     */
    cbBits {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Extended logical pen, including the <b>elpStyleEntry</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a> structure.
     * @type {EXTLOGPEN32}
     */
    elp{
        get {
            if(!this.HasProp("__elp"))
                this.__elp := EXTLOGPEN32(this.ptr + 32)
            return this.__elp
        }
    }
}
