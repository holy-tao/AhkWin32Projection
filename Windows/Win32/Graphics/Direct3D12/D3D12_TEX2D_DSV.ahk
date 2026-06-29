#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresource from a 2D texture that is accessible to a depth-stencil view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure to view the resource as a 2D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_dsv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2D_DSV {
    #StructPack 4

    /**
     * The index of the first mipmap level to use.
     */
    MipSlice : UInt32

}
