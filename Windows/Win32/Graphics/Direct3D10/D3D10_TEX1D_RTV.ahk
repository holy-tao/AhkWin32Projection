#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource from a 1D texture to use in a render-target view. (D3D10_TEX1D_RTV)
 * @remarks
 * This structure is one member of a render-target-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex1d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_TEX1D_RTV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the mipmap level to use (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">mip slice</a>).
     */
    MipSlice : UInt32

}
