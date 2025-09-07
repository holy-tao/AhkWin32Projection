#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the fill mode to use when rendering triangles. (D3D11_FILL_MODE)
 * @remarks
 * This enumeration is part of a rasterizer-state object description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_fill_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FILL_MODE{

    /**
     * Draw lines connecting the vertices. Adjacent vertices are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D11_FILL_WIREFRAME => 2

    /**
     * Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D11_FILL_SOLID => 3
}
