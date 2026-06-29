#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDBLTFX.ahk" { DDBLTFX }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_BLTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDDestSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    rDest : RECTL

    lpDDSrcSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    rSrc : RECTL

    dwFlags : UInt32

    dwROPFlags : UInt32

    bltFX : DDBLTFX

    ddRVal : HRESULT

    Blt : IntPtr

    IsClipped : BOOL

    rOrigDest : RECTL

    rOrigSrc : RECTL

    dwRectCnt : UInt32

    prDestRects : RECT.Ptr

}
