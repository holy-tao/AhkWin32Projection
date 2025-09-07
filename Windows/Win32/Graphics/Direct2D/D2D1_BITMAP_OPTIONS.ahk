#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a bitmap can be used.
 * @remarks
 * <b>D2D1_BITMAP_OPTIONS_NONE</b> implies that none of the flags are set. This means that the bitmap can be used for drawing from, cannot be set as a target and cannot be read from by the CPU.
  * 
  * <b>D2D1_BITMAP_OPTIONS_TARGET</b> means that the bitmap can be specified as a target in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-settarget">ID2D1DeviceContext::SetTarget</a>. If you also specify the  <b>D2D1_BITMAP_OPTIONS_CANNOT_DRAW</b> flag the bitmap can be used a target but, it cannot be drawn from. Attempting to draw with a bitmap that has both flags set will result in the device context being put into an error state with <b>D2DERR_BITMAP_CANNOT_DRAW</b>.
  * 
  * 
  * 
  * <b>D2D1_BITMAP_OPTIONS_CPU_READ</b> means that the bitmap can be mapped by using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-map">ID2D1Bitmap1::Map</a>. This flag requires <b>D2D1_BITMAP_OPTIONS_CANNOT_DRAW</b> and cannot be combined with any other flags. The bitmap must be updated with the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-copyfrombitmap">CopyFromBitmap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-copyfromrendertarget">CopyFromRenderTarget</a> methods.
  * 
  * 
  * 
  * <div class="alert"><b>Note</b>  You should only use <b>D2D1_BITMAP_OPTIONS_CANNOT_DRAW</b> is when the purpose of the bitmap is to be a target only or when the bitmap will be mapped .</div>
  * <div> </div>
  * <b>D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE</b> means that it is possible to get a DC associated with this bitmap.  This must be used in conjunction with <b>D2D1_BITMAP_OPTIONS_TARGET</b>. The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> must be either <b>DXGI_FORMAT_B8G8R8A8_UNORM</b> or <b>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAP_OPTIONS{

    /**
     * The bitmap is created with default properties.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_OPTIONS_NONE => 0

    /**
     * The bitmap can be used as a device context target.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_OPTIONS_TARGET => 1

    /**
     * The bitmap cannot be used as an input.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_OPTIONS_CANNOT_DRAW => 2

    /**
     * The bitmap can be read from the CPU.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_OPTIONS_CPU_READ => 4

    /**
     * The bitmap works with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">ID2D1GdiInteropRenderTarget::GetDC</a>.
 * 
 * <div class="alert"><b>Note</b>  This flag is not available in Windows Store apps.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE => 8
}
