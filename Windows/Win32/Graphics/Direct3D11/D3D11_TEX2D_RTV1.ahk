#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresource from a 2D texture to use in a render-target view. (D3D11_TEX2D_RTV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_rtv1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_RTV1 {
    #StructPack 4

    /**
     * The index of the mipmap level to use mip slice.
     */
    MipSlice : UInt32

    /**
     * The index (plane slice number) of the plane to use in the texture.
     */
    PlaneSlice : UInt32

}
