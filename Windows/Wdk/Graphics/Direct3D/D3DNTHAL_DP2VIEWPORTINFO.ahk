#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2VIEWPORTINFO {
    #StructPack 4

    dwX : UInt32

    dwY : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

}
