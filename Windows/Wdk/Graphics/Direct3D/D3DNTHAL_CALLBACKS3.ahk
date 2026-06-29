#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CALLBACKS3 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    Clear2 : IntPtr

    lpvReserved : IntPtr

    ValidateTextureStageState : IntPtr

    DrawPrimitives2 : IntPtr

}
