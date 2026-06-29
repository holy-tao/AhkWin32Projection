#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2RESPONSE {
    #StructPack 4

    bCommand : Int8

    bReserved : Int8

    wStateCount : UInt16

    dwTotalSize : UInt32

}
