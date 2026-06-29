#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2SETPRIORITY {
    #StructPack 4

    dwDDSurface : UInt32

    dwPriority : UInt32

}
