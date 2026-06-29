#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_DC_INITIALIZE_MODE.ahk" { D2D1_DC_INITIALIZE_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device context that can accept GDI drawing commands.
 * @remarks
 * You don't create an <b>ID2D1GdiInteropRenderTarget</b> object directly; instead, you use the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of an existing render target instance to provide an <b>ID2D1GdiInteropRenderTarget</b> version of that render target. 
 * 
 * Not all render targets support the <b>ID2D1GdiInteropRenderTarget</b> interface. The render target must be GDI-compatible (the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage">D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE</a> flag was specified when creating the render target), use the <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> pixel format, and use  the <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a> or <b>D2D1_ALPHA_MODE_IGNORE</b>  alpha mode.
 * 
 * Note that the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method always succeeds; if the render target doesn't support the <b>ID2D1GdiInteropRenderTarget</b> interface, calling <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">GetDC</a> will fail. (For render targets created through the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(d2d1_size_f_d2d1_size_u_d2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">CreateCompatibleRenderTarget</a> method, the render target that created it must have these settings.) 
 * 
 * To test whether a given render target supports the <b>ID2D1GdiInteropRenderTarget</b> interface, create a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES </a> that specifies GDI compatibility and the appropriate pixel format, then call the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)">IsSupported</a> method to see whether the render target is GDI-compatible.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gdiinteroprendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GdiInteropRenderTarget extends IUnknown {
    /**
     * The interface identifier for ID2D1GdiInteropRenderTarget
     * @type {Guid}
     */
    static IID := Guid("{e0db51c3-6f77-4bae-b3d5-e47509b35838}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GdiInteropRenderTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDC     : IntPtr
        ReleaseDC : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GdiInteropRenderTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the device context associated with this render target.
     * @remarks
     * Calling this method flushes the render target.
     * 
     * This command can be called only after <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> and before <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a>. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7 and earlier, you should not call <b>GetDC</b> between <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)">PushAxisAlignedClip</a>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip">PopAxisAlignedClip</a> commands or between <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a>.  However, this restriction does not apply to Windows 8 and later.</div>
     * <div> </div>
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-releasedc">ReleaseDC</a> must be called once for each call to <b>GetDC</b>.
     * @param {D2D1_DC_INITIALIZE_MODE} _mode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dc_initialize_mode">D2D1_DC_INITIALIZE_MODE</a></b>
     * 
     * A value that specifies whether the device context should be cleared.
     * @returns {HDC} Type: <b>HDC*</b>
     * 
     * When this method returns, contains the device context associated with this render target. You must allocate storage for this parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc
     */
    GetDC(_mode) {
        _hdc := HDC()
        result := ComCall(3, this, D2D1_DC_INITIALIZE_MODE, _mode, HDC.Ptr, _hdc, "HRESULT")
        return _hdc
    }

    /**
     * Indicates that drawing with the device context retrieved using the GetDC method is finished.
     * @remarks
     * <b>ReleaseDC</b> must be called once for each call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">GetDC</a>.
     * @param {Pointer<RECT>} update Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The modified region of the device context, or <b>NULL</b> to specify the entire render target.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-releasedc
     */
    ReleaseDC(update) {
        result := ComCall(4, this, RECT.Ptr, update, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1GdiInteropRenderTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDC := CallbackCreate(GetMethod(implObj, "GetDC"), flags, 3)
        this.vtbl.ReleaseDC := CallbackCreate(GetMethod(implObj, "ReleaseDC"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDC)
        CallbackFree(this.vtbl.ReleaseDC)
    }
}
