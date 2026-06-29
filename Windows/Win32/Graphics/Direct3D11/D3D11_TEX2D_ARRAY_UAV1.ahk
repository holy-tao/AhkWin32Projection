#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an array of unordered-access 2D texture resources. (D3D11_TEX2D_ARRAY_UAV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_uav1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_ARRAY_UAV1 {
    #StructPack 4

    /**
     * The mipmap slice index.
     */
    MipSlice : UInt32

    /**
     * The zero-based index of the first array slice to be accessed.
     */
    FirstArraySlice : UInt32

    /**
     * The number of slices in the array.
     */
    ArraySize : UInt32

    /**
     * The index (plane slice number) of the plane to use in an array of textures.
     */
    PlaneSlice : UInt32

}
