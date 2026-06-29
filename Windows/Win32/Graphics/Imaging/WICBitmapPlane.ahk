#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies the pixel format, buffer, stride and size of a component plane for a planar pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplane
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapPlane {
    #StructPack 8

    /**
     * Type: <b>WICPixelFormatGUID</b>
     * 
     * Describes the pixel format of the plane.
     */
    Format : Guid

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the buffer that holds the plane’s pixel components.
     */
    pbBuffer : IntPtr

    /**
     * Type: <b>UINT</b>
     * 
     * The stride of the buffer pointed to by <i>pbData</i>.  Stride indicates the total number of bytes to go from the beginning of one scanline to the beginning of the next scanline.
     */
    cbStride : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The total size of the buffer pointed to by <i>pbBuffer</i>.
     */
    cbBufferSize : UInt32

}
