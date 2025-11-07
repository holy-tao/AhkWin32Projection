#Requires AutoHotkey v2.0.0 64-bit

/**
 * Depth-stencil view options.
 * @remarks
 * 
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>.
 * 
 * Limiting a depth-stencil buffer to read-only access allows more than one depth-stencil view to be bound to the pipeline simultaneously, since it is not possible to have a read/write conflicts between separate views.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_dsv_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_DSV_FLAG{

    /**
     * Indicates that depth values are read only.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_READ_ONLY_DEPTH => 1

    /**
     * Indicates that stencil values are read only.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_READ_ONLY_STENCIL => 2
}
