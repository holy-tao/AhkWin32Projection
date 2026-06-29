#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresource from a 1D texture to use in a render-target view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as a 1D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX1D_RTV {
    #StructPack 4

    /**
     * The index of the mipmap level to use mip slice.
     */
    MipSlice : UInt32

}
