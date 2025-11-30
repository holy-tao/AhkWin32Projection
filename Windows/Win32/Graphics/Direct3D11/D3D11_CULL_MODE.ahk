#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates triangles facing a particular direction are not drawn.
 * @remarks
 * 
 * This enumeration is part of a rasterizer-state object description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_cull_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CULL_MODE extends Win32Enum{

    /**
     * Always draw all triangles.
     * @type {Integer (Int32)}
     */
    static D3D11_CULL_NONE => 1

    /**
     * Do not draw triangles that are front-facing.
     * @type {Integer (Int32)}
     */
    static D3D11_CULL_FRONT => 2

    /**
     * Do not draw triangles that are back-facing.
     * @type {Integer (Int32)}
     */
    static D3D11_CULL_BACK => 3
}
