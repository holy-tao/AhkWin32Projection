#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHALSURFCB_SETCOLORKEY.ahk" { LPDDHALSURFCB_SETCOLORKEY }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

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
