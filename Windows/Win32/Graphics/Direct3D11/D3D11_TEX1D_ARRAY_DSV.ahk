#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresources from an array of 1D textures to use in a depth-stencil view.
 * @remarks
 * This structure is one member of a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_array_dsv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX1D_ARRAY_DSV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first mipmap level to use.
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
     * Number of textures to use.
     */
    ArraySize : UInt32

}
