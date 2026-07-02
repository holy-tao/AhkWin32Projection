#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import ".\LPDDHALSURFCB_UPDATEOVERLAY.ahk" { LPDDHALSURFCB_UPDATEOVERLAY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_UPDATEOVERLAYDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDDestSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    rDest : RECTL

    lpDDSrcSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    rSrc : RECTL

    dwFlags : UInt32

    overlayFX : DDOVERLAYFX

    ddRVal : HRESULT

    UpdateOverlay : LPDDHALSURFCB_UPDATEOVERLAY

}
