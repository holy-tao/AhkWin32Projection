#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresources from an array of 2D textures to use in a render-target view.
 * @remarks
 * This structure is one member of a render-target-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_rtv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_ARRAY_RTV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the mipmap level to use mip slice.
     */
    MipSlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first texture to use in an array of textures.
     */
    FirstArraySlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of textures in the array to use in the render target view, starting from <b>FirstArraySlice</b>.
     */
    ArraySize : UInt32

}
