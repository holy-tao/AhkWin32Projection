#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
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

    SetColorKey : IntPtr

}
