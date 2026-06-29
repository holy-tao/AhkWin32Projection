#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

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

    UpdateOverlay : IntPtr

}
