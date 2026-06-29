#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource(s) from an array of cube textures to use in a shader-resource view.
 * @remarks
 * This structure is one member of a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_shader_resource_view_desc1">D3D10_SHADER_RESOURCE_VIEW_DESC1</a>).
 * 
 * This structure requires Windows Vista Service Pack 1.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/ns-d3d10_1-d3d10_texcube_array_srv1
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_TEXCUBE_ARRAY_SRV1 {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the most detailed mipmap level to use; this number is between 0 and <b>MipLevels</b>.
     */
    MostDetailedMip : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of mipmap levels to use.
     */
    MipLevels : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first 2D texture to use.
     */
    First2DArrayFace : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of cube textures in the array.
     */
    NumCubes : UInt32

}
