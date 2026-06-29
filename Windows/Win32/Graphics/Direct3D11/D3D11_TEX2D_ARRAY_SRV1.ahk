#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from an array of 2D textures to use in a shader-resource view. (D3D11_TEX2D_ARRAY_SRV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_srv1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_ARRAY_SRV1 {
    #StructPack 4

    /**
     * Index of the most detailed mipmap level to use; this number is between 0 and ( <b>MipLevels</b> (from the original Texture2D for which 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a> 
     *             creates a view) - 1).
     */
    MostDetailedMip : UInt32

    /**
     * The maximum number of mipmap levels for the view of the texture. See the remarks in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_tex1d_srv">D3D11_TEX1D_SRV</a>.
     *             
     * 
     * Set to -1 to indicate all the mipmap levels from <b>MostDetailedMip</b> on down to least detailed.
     */
    MipLevels : UInt32

    /**
     * The index of the first texture to use in an array of textures.
     */
    FirstArraySlice : UInt32

    /**
     * Number of textures in the array.
     */
    ArraySize : UInt32

    /**
     * The index (plane slice number) of the plane to use in an array of textures.
     */
    PlaneSlice : UInt32

}
