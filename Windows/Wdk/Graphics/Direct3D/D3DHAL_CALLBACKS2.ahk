#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_CALLBACKS2 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    SetRenderTarget : IntPtr

    Clear : IntPtr

    DrawOnePrimitive : IntPtr

    DrawOneIndexedPrimitive : IntPtr

    DrawPrimitives : IntPtr

}
