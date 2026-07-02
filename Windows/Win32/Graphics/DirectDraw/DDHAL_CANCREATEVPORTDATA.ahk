#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHALVPORTCB_CANCREATEVIDEOPORT.ahk" { LPDDHALVPORTCB_CANCREATEVIDEOPORT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDVIDEOPORTDESC.ahk" { DDVIDEOPORTDESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CANCREATEVPORTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpDDVideoPortDesc : DDVIDEOPORTDESC.Ptr

    ddRVal : HRESULT

    CanCreateVideoPort : LPDDHALVPORTCB_CANCREATEVIDEOPORT

}
