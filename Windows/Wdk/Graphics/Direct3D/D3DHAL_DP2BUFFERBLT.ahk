#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2BUFFERBLT {
    #StructPack 8

    dwDDDestSurface : UInt32

    dwDDSrcSurface : UInt32

    dwOffset : UInt32

    rSrc : IntPtr

    dwFlags : UInt32

}
