#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHAL_SETCOLORKEY.ahk" { LPDDHAL_SETCOLORKEY }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DRVSETCOLORKEYDATA {
    #StructPack 8

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    dwFlags : UInt32

    ckNew : DDCOLORKEY

    ddRVal : HRESULT

    SetColorKey : LPDDHAL_SETCOLORKEY

}
