#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\LPDDHALVPORTCB_FLIP.ahk" { LPDDHALVPORTCB_FLIP }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_FLIPVPORTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpVideoPort : DDRAWI_DDVIDEOPORT_LCL.Ptr

    lpSurfCurr : DDRAWI_DDRAWSURFACE_LCL.Ptr

    lpSurfTarg : DDRAWI_DDRAWSURFACE_LCL.Ptr

    ddRVal : HRESULT

    FlipVideoPort : LPDDHALVPORTCB_FLIP

}
