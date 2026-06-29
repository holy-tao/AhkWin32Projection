#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from an array of multi sampled 2D textures for a depth-stencil view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure to view the resource as an array of multi sampled 2D textures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_array_dsv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2DMS_ARRAY_DSV {
    #StructPack 4

    /**
     * The index of the first texture to use in an array of textures.
     */
    FirstArraySlice : UInt32

    /**
     * Number of textures to use.
     */
    ArraySize : UInt32

}
