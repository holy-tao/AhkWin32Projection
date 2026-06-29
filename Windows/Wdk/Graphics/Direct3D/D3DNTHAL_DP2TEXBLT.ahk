#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2TEXBLT {
    #StructPack 8

    dwDDDestSurface : UInt32

    dwDDSrcSurface : UInt32

    pDest : IntPtr

    rSrc : IntPtr

    dwFlags : UInt32

}
