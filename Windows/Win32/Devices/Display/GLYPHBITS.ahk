#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The GLYPHBITS structure is used to define a glyph bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-glyphbits
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GLYPHBITS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin of the character in the bitmap.
     * @type {POINTL}
     */
    ptlOrigin{
        get {
            if(!this.HasProp("__ptlOrigin"))
                this.__ptlOrigin := POINTL(0, this)
            return this.__ptlOrigin
        }
    }

    /**
     * Specifies a SIZEL structure that contains the width and height, in pixels, of the bitmap. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
     * @type {SIZE}
     */
    sizlBitmap{
        get {
            if(!this.HasProp("__sizlBitmap"))
                this.__sizlBitmap := SIZE(8, this)
            return this.__sizlBitmap
        }
    }

    /**
     * Is a variable-sized byte array containing a BYTE-aligned bitmap of the glyph. The array must include padding at the end to DWORD-align the entire structure.
     * 
     * GDI will make this request of drivers that have antialiased fonts (see the description of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfontcaps">DrvQueryFontCaps</a>). It is possible that a driver may not be able to render a font in a multilevel format. In this case, the driver fails the call and GDI will call the driver again requesting a monochrome realization.
     * @type {Array<Byte>}
     */
    aj{
        get {
            if(!this.HasProp("__ajProxyArray"))
                this.__ajProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__ajProxyArray
        }
    }
}
