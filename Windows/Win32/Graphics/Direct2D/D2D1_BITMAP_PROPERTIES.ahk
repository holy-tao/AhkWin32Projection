#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D1_PIXEL_FORMAT.ahk

/**
 * Describes the pixel format and dpi of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_bitmap_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAP_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The bitmap's pixel format and alpha mode.
     * @type {D2D1_PIXEL_FORMAT}
     */
    pixelFormat{
        get {
            if(!this.HasProp("__pixelFormat"))
                this.__pixelFormat := D2D1_PIXEL_FORMAT(this.ptr + 0)
            return this.__pixelFormat
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal dpi of the bitmap.
     * @type {Float}
     */
    dpiX {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical dpi of the bitmap.
     * @type {Float}
     */
    dpiY {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
