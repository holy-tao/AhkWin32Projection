#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D1_PIXEL_FORMAT.ahk

/**
 * This structure allows a ID2D1Bitmap1 to be created with bitmap options and color context information available.
 * @remarks
 * 
  * If both <b>dpiX</b> and <b>dpiY</b> are 0, the dpi of the bitmap will be set to the desktop dpi if the device context is a windowed context, or 96 dpi for any other device context.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAP_PROPERTIES1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The DXGI format and alpha mode to create the bitmap with.
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
     * The bitmap dpi in the x direction.
     * @type {Float}
     */
    dpiX {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The bitmap dpi in the y direction.
     * @type {Float}
     */
    dpiY {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS</a></b>
     * 
     * The special creation options of the bitmap.
     * @type {Integer}
     */
    bitmapOptions {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>*</b>
     * 
     * The optionally specified color context information.
     * @type {Pointer<ID2D1ColorContext>}
     */
    colorContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
