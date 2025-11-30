#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the fill mode to use when rendering triangles.
 * @remarks
 * 
 * This enumeration is part of a rasterizer-state object description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_fill_mode
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_FILL_MODE extends Win32Enum{

    /**
     * Draw lines connecting the vertices. <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-primitive-topologies">Adjacent vertices</a> are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D10_FILL_WIREFRAME => 2

    /**
     * Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D10_FILL_SOLID => 3
}
