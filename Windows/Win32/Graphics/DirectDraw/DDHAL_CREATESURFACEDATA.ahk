#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\LPDDHAL_CREATESURFACE.ahk" { LPDDHAL_CREATESURFACE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CREATESURFACEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurfaceDesc : DDSURFACEDESC.Ptr

    lplpSList : IntPtr

    dwSCnt : UInt32

    ddRVal : HRESULT

    CreateSurface : LPDDHAL_CREATESURFACE

}
