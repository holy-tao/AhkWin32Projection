#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D1_ALPHA_MODE.ahk" { D2D1_ALPHA_MODE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "Common\D2D1_PIXEL_FORMAT.ahk" { D2D1_PIXEL_FORMAT }

/**
 * Describes the pixel format and dpi of a bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_bitmap_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BITMAP_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The bitmap's pixel format and alpha mode.
     */
    pixelFormat : D2D1_PIXEL_FORMAT

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal dpi of the bitmap.
     */
    dpiX : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical dpi of the bitmap.
     */
    dpiY : Float32

}
