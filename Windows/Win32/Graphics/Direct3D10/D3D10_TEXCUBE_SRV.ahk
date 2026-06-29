#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource from a cube texture to use in a shader-resource view. (D3D10_TEXCUBE_SRV)
 * @remarks
 * This structure is one member of a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_texcube_srv
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_TEXCUBE_SRV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the most detailed mipmap level to use; this number is between 0 and <b>MipLevels</b> -1.
     */
    MostDetailedMip : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of mipmap levels to use.
     */
    MipLevels : UInt32

}
