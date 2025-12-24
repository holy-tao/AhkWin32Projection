#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HDC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to an device context that can accept GDI drawing commands.
 * @remarks
 * 
 * You don't create an <b>ID2D1GdiInteropRenderTarget</b> object directly; instead, you use the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of an existing render target instance to provide an <b>ID2D1GdiInteropRenderTarget</b> version of that render target. 
 * 
 * Not all render targets support the <b>ID2D1GdiInteropRenderTarget</b> interface. The render target must be GDI-compatible (the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage">D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE</a> flag was specified when creating the render target), use the <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> pixel format, and use  the <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a> or <b>D2D1_ALPHA_MODE_IGNORE</b>  alpha mode.
 * 
 * Note that the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method always succeeds; if the render target doesn't support the <b>ID2D1GdiInteropRenderTarget</b> interface, calling <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">GetDC</a> will fail. (For render targets created through the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(d2d1_size_f_d2d1_size_u_d2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">CreateCompatibleRenderTarget</a> method, the render target that created it must have these settings.) 
 * 
 * To test whether a given render target supports the <b>ID2D1GdiInteropRenderTarget</b> interface, create a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES </a>that specifies GDI compatibility and the appropriate pixel format, then call the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)">IsSupported</a> method to see whether the render target is GDI-compatible.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1gdiinteroprendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiInteropRenderTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiInteropRenderTarget
     * @type {Guid}
     */
    static IID => Guid("{e0db51c3-6f77-4bae-b3d5-e47509b35838}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDC", "ReleaseDC"]

    /**
     * Retrieves the device context associated with this render target.
     * @param {Integer} mode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dc_initialize_mode">D2D1_DC_INITIALIZE_MODE</a></b>
     * 
     * A value that specifies whether the device context should be cleared.
     * @returns {HDC} Type: <b>HDC*</b>
     * 
     * When this method returns, contains the device context associated with this render target. You must allocate storage for this parameter.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc
     */
    GetDC(mode) {
        hdc := HDC()
        result := ComCall(3, this, "int", mode, "ptr", hdc, "HRESULT")
        return hdc
    }

    /**
     * Indicates that drawing with the device context retrieved using the GetDC method is finished.
     * @param {Pointer<RECT>} update Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The modified region of the device context, or <b>NULL</b> to specify the entire render target.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gdiinteroprendertarget-releasedc
     */
    ReleaseDC(update) {
        result := ComCall(4, this, "ptr", update, "HRESULT")
        return result
    }
}
