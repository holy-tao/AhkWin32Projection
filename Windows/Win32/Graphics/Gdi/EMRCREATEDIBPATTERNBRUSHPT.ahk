#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRCREATEDIBPATTERNBRUSHPT structure contains members for the CreateDIBPatternBrushPt enhanced metafile record. The BITMAPINFO structure is followed by the bitmap bits that form a packed device-independent bitmap (DIB).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatedibpatternbrushpt
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRCREATEDIBPATTERNBRUSHPT extends Win32Struct
{
    static sizeof => 32

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
     * Index of brush in handle table.
     * @type {Integer}
     */
    ihBrush {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Value specifying whether the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure was provided and, if so, whether <b>bmiColors</b> contains explicit red, green, blue (RGB) values or indices. The <b>iUsage</b> member must be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     * @type {Integer}
     */
    iUsage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmi {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmi {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset to bitmap bits.
     * @type {Integer}
     */
    offBits {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of bitmap bits.
     * @type {Integer}
     */
    cbBits {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
