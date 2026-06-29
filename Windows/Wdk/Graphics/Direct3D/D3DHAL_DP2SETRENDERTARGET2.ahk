#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2SETRENDERTARGET2 {
    #StructPack 4

    RTIndex : UInt32

    hRenderTarget : UInt32

}
