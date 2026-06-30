#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies the pixel format, buffer, stride and size of a component plane for a planar pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplane
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapPlane extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>WICPixelFormatGUID</b>
     * 
     * Describes the pixel format of the plane.
     * @type {Guid}
     */
    Format {
        get {
            if(!this.HasProp("__Format"))
                this.__Format := Guid(0, this)
            return this.__Format
        }
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the buffer that holds the plane’s pixel components.
     * @type {Pointer<Integer>}
     */
    pbBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The stride of the buffer pointed to by <i>pbData</i>.  Stride indicates the total number of bytes to go from the beginning of one scanline to the beginning of the next scanline.
     * @type {Integer}
     */
    cbStride {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The total size of the buffer pointed to by <i>pbBuffer</i>.
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
