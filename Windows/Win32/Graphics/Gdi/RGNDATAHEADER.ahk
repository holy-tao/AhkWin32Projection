#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The RGNDATAHEADER structure describes the data returned by the GetRegionData function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-rgndataheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RGNDATAHEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the header.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of region. This value must be RDH_RECTANGLES.
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of rectangles that make up the region.
     * @type {Integer}
     */
    nCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> buffer required to receive the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures that make up the region. If the size is not known, this member can be zero.
     * @type {Integer}
     */
    nRgnSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A bounding rectangle for the region in logical units.
     * @type {RECT}
     */
    rcBound{
        get {
            if(!this.HasProp("__rcBound"))
                this.__rcBound := RECT(this.ptr + 16)
            return this.__rcBound
        }
    }
}
