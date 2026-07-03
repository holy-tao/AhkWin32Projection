#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORCONTROL.ahk" { DDCOLORCONTROL }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHALCOLORCB_COLORCONTROL.ahk" { LPDDHALCOLORCB_COLORCONTROL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_COLORCONTROLDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    lpColorData : DDCOLORCONTROL.Ptr

    dwFlags : UInt32

    ddRVal : HRESULT

    ColorControl : LPDDHALCOLORCB_COLORCONTROL

}
