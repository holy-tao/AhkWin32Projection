#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID2D1ColorContext.ahk" { ID2D1ColorContext }
#Import "Common\D2D1_ALPHA_MODE.ahk" { D2D1_ALPHA_MODE }
#Import ".\D2D1_BITMAP_OPTIONS.ahk" { D2D1_BITMAP_OPTIONS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "Common\D2D1_PIXEL_FORMAT.ahk" { D2D1_PIXEL_FORMAT }

/**
 * This structure allows a ID2D1Bitmap1 to be created with bitmap options and color context information available.
 * @remarks
 * If both <b>dpiX</b> and <b>dpiY</b> are 0, the dpi of the bitmap will be set to the desktop dpi if the device context is a windowed context, or 96 dpi for any other device context.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BITMAP_PROPERTIES1 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The DXGI format and alpha mode to create the bitmap with.
     */
    pixelFormat : D2D1_PIXEL_FORMAT

    /**
     * Type: <b>FLOAT</b>
     * 
     * The bitmap dpi in the x direction.
     */
    dpiX : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The bitmap dpi in the y direction.
     */
    dpiY : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS</a></b>
     * 
     * The special creation options of the bitmap.
     */
    bitmapOptions : D2D1_BITMAP_OPTIONS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>*</b>
     * 
     * The optionally specified color context information.
     */
    colorContext : ID2D1ColorContext

}
