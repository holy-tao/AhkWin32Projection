#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CALLBACKS2 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    SetRenderTarget : IntPtr

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

    dwReserved3 : IntPtr

    dwReserved4 : IntPtr

}
