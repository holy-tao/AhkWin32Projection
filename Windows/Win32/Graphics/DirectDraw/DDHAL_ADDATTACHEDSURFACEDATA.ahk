#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHALSURFCB_ADDATTACHEDSURFACE.ahk" { LPDDHALSURFCB_ADDATTACHEDSURFACE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_ADDATTACHEDSURFACEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    lpSurfAttached : DDRAWI_DDRAWSURFACE_LCL.Ptr

    ddRVal : HRESULT

    AddAttachedSurface : LPDDHALSURFCB_ADDATTACHEDSURFACE

}
