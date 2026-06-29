#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2SETCLIPPLANE {
    #StructPack 4

    dwIndex : UInt32

    plane : Float32[4]

}
