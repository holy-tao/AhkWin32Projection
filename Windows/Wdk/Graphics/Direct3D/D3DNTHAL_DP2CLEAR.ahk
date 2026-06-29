#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2CLEAR {
    #StructPack 8

    dwFlags : UInt32

    dwFillColor : UInt32

    dvFillDepth : Float32

    dwFillStencil : UInt32

    Rects : IntPtr[1]

}
