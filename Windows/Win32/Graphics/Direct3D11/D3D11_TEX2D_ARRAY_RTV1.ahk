#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresources from an array of 2D textures to use in a render-target view. (D3D11_TEX2D_ARRAY_RTV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_rtv1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_ARRAY_RTV1 {
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
     * Number of textures in the array to use in the render-target view, starting from <b>FirstArraySlice</b>.
     */
    ArraySize : UInt32

    /**
     * The index (plane slice number) of the plane to use in an array of textures.
     */
    PlaneSlice : UInt32

}
