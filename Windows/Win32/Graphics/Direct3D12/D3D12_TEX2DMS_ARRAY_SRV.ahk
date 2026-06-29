#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from an array of multi sampled 2D textures to use in a shader-resource view.
 * @remarks
 * This structure is one member of a shader-resource-view description, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_array_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2DMS_ARRAY_SRV {
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
