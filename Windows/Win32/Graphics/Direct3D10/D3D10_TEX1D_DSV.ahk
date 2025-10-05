#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource from a 1D texture that is accessible to a depth-stencil view. (D3D10_TEX1D_DSV)
 * @remarks
 * This structure is one member of a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_view_desc">D3D10_DEPTH_STENCIL_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex1d_dsv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEX1D_DSV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first mipmap level to use (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">mip slice</a>).
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
