#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2SETSTREAMSOURCEFREQ {
    #StructPack 4

    dwStream : UInt32

    dwDivider : UInt32

}
