#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALVPORTCB_GETFIELD.ahk" { LPDDHALVPORTCB_GETFIELD }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETVPORTFIELDDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpVideoPort : DDRAWI_DDVIDEOPORT_LCL.Ptr

    bField : BOOL

    ddRVal : HRESULT

    GetVideoPortField : LPDDHALVPORTCB_GETFIELD

}
