#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CALLBACKS {
    #StructPack 8

    dwSize : UInt32

    ContextCreate : IntPtr

    ContextDestroy : IntPtr

    ContextDestroyAll : IntPtr

    SceneCapture : IntPtr

    dwReserved10 : IntPtr

    dwReserved11 : IntPtr

    dwReserved22 : IntPtr

    dwReserved23 : IntPtr

    dwReserved : IntPtr

    TextureCreate : IntPtr

    TextureDestroy : IntPtr

    TextureSwap : IntPtr

    TextureGetSurf : IntPtr

    dwReserved12 : IntPtr

    dwReserved13 : IntPtr

    dwReserved14 : IntPtr

    dwReserved15 : IntPtr

    dwReserved16 : IntPtr

    dwReserved17 : IntPtr

    dwReserved18 : IntPtr

    dwReserved19 : IntPtr

    dwReserved20 : IntPtr

    dwReserved21 : IntPtr

    dwReserved24 : IntPtr

    dwReserved0 : IntPtr

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

    dwReserved3 : IntPtr

    dwReserved4 : IntPtr

    dwReserved5 : IntPtr

    dwReserved6 : IntPtr

    dwReserved7 : IntPtr

    dwReserved8 : IntPtr

    dwReserved9 : IntPtr

}
