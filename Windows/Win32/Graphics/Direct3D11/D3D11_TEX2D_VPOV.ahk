#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies a texture resource for a video processor output view. (D3D11_TEX2D_VPOV)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vpov
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_VPOV {
    #StructPack 4

    /**
     * The zero-based index into the array of subtextures.
     */
    MipSlice : UInt32

}
