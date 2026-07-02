#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPD3DHAL_RENDERSTATECB.ahk" { LPD3DHAL_RENDERSTATECB }
#Import ".\LPD3DHAL_GETSTATECB.ahk" { LPD3DHAL_GETSTATECB }
#Import ".\LPD3DHAL_RENDERPRIMITIVECB.ahk" { LPD3DHAL_RENDERPRIMITIVECB }
#Import ".\LPD3DHAL_TEXTUREDESTROYCB.ahk" { LPD3DHAL_TEXTUREDESTROYCB }
#Import ".\LPD3DHAL_TEXTURESWAPCB.ahk" { LPD3DHAL_TEXTURESWAPCB }
#Import ".\LPD3DHAL_TEXTURECREATECB.ahk" { LPD3DHAL_TEXTURECREATECB }
#Import ".\LPD3DHAL_CONTEXTCREATECB.ahk" { LPD3DHAL_CONTEXTCREATECB }
#Import ".\LPD3DHAL_TEXTUREGETSURFCB.ahk" { LPD3DHAL_TEXTUREGETSURFCB }
#Import ".\LPD3DHAL_SCENECAPTURECB.ahk" { LPD3DHAL_SCENECAPTURECB }
#Import ".\LPD3DHAL_CONTEXTDESTROYALLCB.ahk" { LPD3DHAL_CONTEXTDESTROYALLCB }
#Import ".\LPD3DHAL_CONTEXTDESTROYCB.ahk" { LPD3DHAL_CONTEXTDESTROYCB }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_CALLBACKS {
    #StructPack 8

    dwSize : UInt32

    ContextCreate : LPD3DHAL_CONTEXTCREATECB

    ContextDestroy : LPD3DHAL_CONTEXTDESTROYCB

    ContextDestroyAll : LPD3DHAL_CONTEXTDESTROYALLCB

    SceneCapture : LPD3DHAL_SCENECAPTURECB

    lpReserved10 : IntPtr

    lpReserved11 : IntPtr

    RenderState : LPD3DHAL_RENDERSTATECB

    RenderPrimitive : LPD3DHAL_RENDERPRIMITIVECB

    dwReserved : UInt32

    TextureCreate : LPD3DHAL_TEXTURECREATECB

    TextureDestroy : LPD3DHAL_TEXTUREDESTROYCB

    TextureSwap : LPD3DHAL_TEXTURESWAPCB

    TextureGetSurf : LPD3DHAL_TEXTUREGETSURFCB

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

    GetState : LPD3DHAL_GETSTATECB

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
