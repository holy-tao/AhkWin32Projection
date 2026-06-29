#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresources from an array of multisampled 2D textures to use in a shader-resource view.
 * @remarks
 * This structure is one member of a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_array_srv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2DMS_ARRAY_SRV {
    #StructPack 4

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
