#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHALSURFCB_SETCOLORKEY.ahk" { LPDDHALSURFCB_SETCOLORKEY }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_SETCOLORKEYDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    dwFlags : UInt32

    ckNew : DDCOLORKEY

    ddRVal : HRESULT

    SetColorKey : LPDDHALSURFCB_SETCOLORKEY

}
