#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Bitmap.ahk
#Include .\ID2D1RenderTarget.ahk

/**
 * Renders to an intermediate texture created by the CreateCompatibleRenderTarget method.
 * @remarks
 * 
 * An <b>ID2D1BitmapRenderTarget</b>  writes to an intermediate texture. It's useful for creating patterns for use with an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> or caching drawing data that will be used repeatedly. 
 * 
 * To write directly to a WIC bitmap instead, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createwicbitmaprendertarget">ID2D1Factory::CreateWicBitmapRenderTarget</a> method. This method returns an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> that writes to the specified WIC bitmap. 
 *       
 * 
 * <h3><a id="Creating_ID2D1BitmapRenderTarget_Objects"></a><a id="creating_id2d1bitmaprendertarget_objects"></a><a id="CREATING_ID2D1BITMAPRENDERTARGET_OBJECTS"></a>Creating ID2D1BitmapRenderTarget Objects</h3>
 * To create a bitmap render target, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(constd2d1_size_f_constd2d1_size_u_constd2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">ID2D1RenderTarget::CreateCompatibleRenderTarget</a> method.
 * 
 * Like other render targets, an <b>ID2D1BitmapRenderTarget</b> is a device-dependent resource and must be recreated when the associated device becomes unavailable. For more information, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1bitmaprendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BitmapRenderTarget extends ID2D1RenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BitmapRenderTarget
     * @type {Guid}
     */
    static IID => Guid("{2cd90695-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBitmap"]

    /**
     * Retrieves the bitmap for this render target. The returned bitmap can be used for drawing operations.
     * @returns {ID2D1Bitmap} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the bitmap for this render target. This bitmap can be used for drawing operations.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmaprendertarget-getbitmap
     */
    GetBitmap() {
        result := ComCall(57, this, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap(bitmap)
    }
}
