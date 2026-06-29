#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CREATESURFACEEXDATA {
    #StructPack 8

    dwFlags : UInt32

    lpDDLcl : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpDDSLcl : DDRAWI_DDRAWSURFACE_LCL.Ptr

    ddRVal : HRESULT

}
