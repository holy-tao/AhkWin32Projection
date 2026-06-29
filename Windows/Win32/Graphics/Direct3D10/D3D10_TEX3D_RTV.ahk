#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource(s) from a 3D texture to use in a render-target view.
 * @remarks
 * This structure is one member of a render target view. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex3d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_TEX3D_RTV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the mipmap level to use (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">mip slice</a>).
     */
    MipSlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * First depth level to use.
     */
    FirstWSlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of depth levels to use in the render-target view, starting from <b>FirstWSlice</b>. A value of -1 indicates all of the slices along the w axis, starting from <b>FirstWSlice</b>.
     */
    WSize : UInt32

}
