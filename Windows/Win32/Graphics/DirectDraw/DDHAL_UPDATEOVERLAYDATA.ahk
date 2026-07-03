#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\LPDDHALSURFCB_UPDATEOVERLAY.ahk" { LPDDHALSURFCB_UPDATEOVERLAY }

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
