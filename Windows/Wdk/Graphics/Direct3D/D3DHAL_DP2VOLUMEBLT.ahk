#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2VOLUMEBLT {
    #StructPack 8

    dwDDDestSurface : UInt32

    dwDDSrcSurface : UInt32

    dwDestX : UInt32

    dwDestY : UInt32

    dwDestZ : UInt32

    srcBox : IntPtr

    dwFlags : UInt32

}
