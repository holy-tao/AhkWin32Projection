#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the pixel format, buffer, stride and size of a component plane for a planar pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplane
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapPlane extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>WICPixelFormatGUID</b>
     * 
     * Describes the pixel format of the plane.
     * @type {Pointer<Guid>}
     */
    Format {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the buffer that holds the plane’s pixel components.
     * @type {Pointer<Byte>}
     */
    pbBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The stride of the buffer pointed to by <i>pbData</i>.  Stride indicates the total number of bytes to go from the beginning of one scanline to the beginning of the next scanline.
     * @type {Integer}
     */
    cbStride {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The total size of the buffer pointed to by <i>pbBuffer</i>.
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
