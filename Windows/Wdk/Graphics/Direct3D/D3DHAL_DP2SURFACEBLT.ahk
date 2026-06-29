#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2SURFACEBLT {
    #StructPack 8

    dwSource : UInt32

    rSource : IntPtr

    dwSourceMipLevel : UInt32

    dwDest : UInt32

    rDest : IntPtr

    dwDestMipLevel : UInt32

    Flags : UInt32

}
