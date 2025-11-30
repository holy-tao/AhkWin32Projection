#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the edges of nontext primitives are rendered.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_antialias_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ANTIALIAS_MODE extends Win32Enum{

    /**
     * Edges are antialiased using the Direct2D per-primitive method of high-quality antialiasing.
     * @type {Integer (Int32)}
     */
    static D2D1_ANTIALIAS_MODE_PER_PRIMITIVE => 0

    /**
     * Objects are aliased in most cases. Objects are antialiased only when they are drawn to a render target created by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties__id2d1rendertarget)">CreateDxgiSurfaceRenderTarget</a> method and  Direct3D multisampling has been enabled on the backing DirectX Graphics Infrastructure (DXGI) surface.
     * @type {Integer (Int32)}
     */
    static D2D1_ANTIALIAS_MODE_ALIASED => 1
}
