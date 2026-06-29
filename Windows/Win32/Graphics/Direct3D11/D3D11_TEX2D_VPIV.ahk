#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the texture resource for a video processor input view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vpiv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_VPIV {
    #StructPack 4

    /**
     * The zero-based index into the array of subtextures.
     */
    MipSlice : UInt32

    /**
     * The zero-based index of the texture.
     */
    ArraySlice : UInt32

}
