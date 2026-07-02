#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDVIDEOPORTDESC.ahk" { DDVIDEOPORTDESC }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALVPORTCB_CREATEVIDEOPORT.ahk" { LPDDHALVPORTCB_CREATEVIDEOPORT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CREATEVPORTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpDDVideoPortDesc : DDVIDEOPORTDESC.Ptr

    lpVideoPort : DDRAWI_DDVIDEOPORT_LCL.Ptr

    ddRVal : HRESULT

    CreateVideoPort : LPDDHALVPORTCB_CREATEVIDEOPORT

}
