#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\RGNDATAHEADER.ahk

/**
 * The RGNDATA structure contains a header and an array of rectangles that compose a region. The rectangles are sorted top to bottom, left to right. They do not overlap.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-rgndata
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RGNDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndataheader">RGNDATAHEADER</a> structure. The members of this structure specify the type of region (whether it is rectangular or trapezoidal), the number of rectangles that make up the region, the size of the buffer that contains the rectangle structures, and so on.
     * @type {RGNDATAHEADER}
     */
    rdh{
        get {
            if(!this.HasProp("__rdh"))
                this.__rdh := RGNDATAHEADER(0, this)
            return this.__rdh
        }
    }

    /**
     * Specifies an arbitrary-size buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures that make up the region.
     * @type {String}
     */
    Buffer {
        get => StrGet(this.ptr + 32, 0, "UTF-16")
        set => StrPut(value, this.ptr + 32, 0, "UTF-16")
    }
}
