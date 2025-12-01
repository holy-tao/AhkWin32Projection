#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates triangles facing a particular direction are not drawn. (D3D10_CULL_MODE)
 * @remarks
 * This enumeration is part of a rasterizer-state object description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_cull_mode
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_CULL_MODE extends Win32Enum{

    /**
     * Always draw all triangles.
     * @type {Integer (Int32)}
     */
    static D3D10_CULL_NONE => 1

    /**
     * Do not draw triangles that are front-facing.
     * @type {Integer (Int32)}
     */
    static D3D10_CULL_FRONT => 2

    /**
     * Do not draw triangles that are back-facing.
     * @type {Integer (Int32)}
     */
    static D3D10_CULL_BACK => 3
}
