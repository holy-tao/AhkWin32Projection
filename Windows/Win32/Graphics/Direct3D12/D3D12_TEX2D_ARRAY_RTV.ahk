#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from an array of 2D textures to use in a render-target view. (D3D12_TEX2D_ARRAY_RTV)
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as an array of 2D textures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_array_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2D_ARRAY_RTV {
    #StructPack 4

    /**
     * The index of the mipmap level to use mip slice.
     */
    MipSlice : UInt32

    /**
     * The index of the first texture to use in an array of textures.
     */
    FirstArraySlice : UInt32

    /**
     * Number of textures in the array to use in the render target view, starting from <b>FirstArraySlice</b>.
     */
    ArraySize : UInt32

    /**
     * The index (plane slice number) of the plane to use in an array of textures.
     */
    PlaneSlice : UInt32

}
