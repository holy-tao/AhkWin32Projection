#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPD3DNTHAL_TEXTURECREATECB.ahk" { LPD3DNTHAL_TEXTURECREATECB }
#Import ".\LPD3DNTHAL_CONTEXTCREATECB.ahk" { LPD3DNTHAL_CONTEXTCREATECB }
#Import ".\LPD3DNTHAL_TEXTURESWAPCB.ahk" { LPD3DNTHAL_TEXTURESWAPCB }
#Import ".\LPD3DNTHAL_TEXTUREGETSURFCB.ahk" { LPD3DNTHAL_TEXTUREGETSURFCB }
#Import ".\LPD3DNTHAL_TEXTUREDESTROYCB.ahk" { LPD3DNTHAL_TEXTUREDESTROYCB }
#Import ".\LPD3DNTHAL_CONTEXTDESTROYALLCB.ahk" { LPD3DNTHAL_CONTEXTDESTROYALLCB }
#Import ".\LPD3DNTHAL_SCENECAPTURECB.ahk" { LPD3DNTHAL_SCENECAPTURECB }
#Import ".\LPD3DNTHAL_CONTEXTDESTROYCB.ahk" { LPD3DNTHAL_CONTEXTDESTROYCB }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CALLBACKS {
    #StructPack 8

    dwSize : UInt32

    ContextCreate : LPD3DNTHAL_CONTEXTCREATECB

    ContextDestroy : LPD3DNTHAL_CONTEXTDESTROYCB

    ContextDestroyAll : LPD3DNTHAL_CONTEXTDESTROYALLCB

    SceneCapture : LPD3DNTHAL_SCENECAPTURECB

    dwReserved10 : IntPtr

    dwReserved11 : IntPtr

    dwReserved22 : IntPtr

    dwReserved23 : IntPtr

    dwReserved : IntPtr

    TextureCreate : LPD3DNTHAL_TEXTURECREATECB

    TextureDestroy : LPD3DNTHAL_TEXTUREDESTROYCB

    TextureSwap : LPD3DNTHAL_TEXTURESWAPCB

    TextureGetSurf : LPD3DNTHAL_TEXTUREGETSURFCB

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
