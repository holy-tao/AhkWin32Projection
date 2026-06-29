#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from a 3D texture to use in a render-target view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as a 3D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX3D_RTV {
    #StructPack 4

    /**
     * The index of the mipmap level to use mip slice.
     */
    MipSlice : UInt32

    /**
     * First depth level to use.
     */
    FirstWSlice : UInt32

    /**
     * Number of depth levels to use in the render-target view, starting from <b>FirstWSlice</b>. A value of -1 indicates all of the slices along the w axis, starting from <b>FirstWSlice</b>.
     */
    WSize : UInt32

}
