#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }
#Import ".\ID2D1RenderTarget.ahk" { ID2D1RenderTarget }

/**
 * Renders to an intermediate texture created by the CreateCompatibleRenderTarget method.
 * @remarks
 * An <b>ID2D1BitmapRenderTarget</b>  writes to an intermediate texture. It's useful for creating patterns for use with an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> or caching drawing data that will be used repeatedly. 
 * 
 * To write directly to a WIC bitmap instead, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createwicbitmaprendertarget">ID2D1Factory::CreateWicBitmapRenderTarget</a> method. This method returns an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> that writes to the specified WIC bitmap. 
 *       
 * 
 * <h3><a id="Creating_ID2D1BitmapRenderTarget_Objects"></a><a id="creating_id2d1bitmaprendertarget_objects"></a><a id="CREATING_ID2D1BITMAPRENDERTARGET_OBJECTS"></a>Creating ID2D1BitmapRenderTarget Objects</h3>
 * To create a bitmap render target, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(constd2d1_size_f_constd2d1_size_u_constd2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">ID2D1RenderTarget::CreateCompatibleRenderTarget</a> method.
 * 
 * Like other render targets, an <b>ID2D1BitmapRenderTarget</b> is a device-dependent resource and must be recreated when the associated device becomes unavailable. For more information, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmaprendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BitmapRenderTarget extends ID2D1RenderTarget {
    /**
     * The interface identifier for ID2D1BitmapRenderTarget
     * @type {Guid}
     */
    static IID := Guid("{2cd90695-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BitmapRenderTarget interfaces
    */
    struct Vtbl extends ID2D1RenderTarget.Vtbl {
        GetBitmap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BitmapRenderTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the bitmap for this render target. The returned bitmap can be used for drawing operations.
     * @remarks
     * The DPI for the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> obtained from <b>GetBitmap</b> will be the DPI of the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmaprendertarget">ID2D1BitmapRenderTarget</a> when the render target was created. Changing the DPI of the <b>ID2D1BitmapRenderTarget</b> by calling  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setdpi">SetDpi</a> doesn't affect the DPI of the bitmap, even if <b>SetDpi</b> is called before <b>GetBitmap</b>. Using <b>SetDpi</b> to change the DPI of the <b>ID2D1BitmapRenderTarget</b> does affect how contents are rendered into the bitmap: it just doesn't affect the DPI of the bitmap retrieved by <b>GetBitmap</b>.
     * @returns {ID2D1Bitmap} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the bitmap for this render target. This bitmap can be used for drawing operations.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmaprendertarget-getbitmap
     */
    GetBitmap() {
        result := ComCall(57, this, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap(_bitmap)
    }

    Query(iid) {
        if (ID2D1BitmapRenderTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBitmap := CallbackCreate(GetMethod(implObj, "GetBitmap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBitmap)
    }
}
