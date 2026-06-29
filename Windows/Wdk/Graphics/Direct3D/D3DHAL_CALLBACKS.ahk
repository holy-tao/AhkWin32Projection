#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_CALLBACKS {
    #StructPack 8

    dwSize : UInt32

    ContextCreate : IntPtr

    ContextDestroy : IntPtr

    ContextDestroyAll : IntPtr

    SceneCapture : IntPtr

    lpReserved10 : IntPtr

    lpReserved11 : IntPtr

    RenderState : IntPtr

    RenderPrimitive : IntPtr

    dwReserved : UInt32

    TextureCreate : IntPtr

    TextureDestroy : IntPtr

    TextureSwap : IntPtr

    TextureGetSurf : IntPtr

    lpReserved12 : IntPtr

    lpReserved13 : IntPtr

    lpReserved14 : IntPtr

    lpReserved15 : IntPtr

    lpReserved16 : IntPtr

    lpReserved17 : IntPtr

    lpReserved18 : IntPtr

    lpReserved19 : IntPtr

    lpReserved20 : IntPtr

    lpReserved21 : IntPtr

    GetState : IntPtr

    dwReserved0 : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

    dwReserved4 : UInt32

    dwReserved5 : UInt32

    dwReserved6 : UInt32

    dwReserved7 : UInt32

    dwReserved8 : UInt32

    dwReserved9 : UInt32

}
