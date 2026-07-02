#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\LPDDHALVPORTCB_GETFLIPSTATUS.ahk" { LPDDHALVPORTCB_GETFLIPSTATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETVPORTFLIPSTATUSDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    fpSurface : IntPtr

    ddRVal : HRESULT

    GetVideoPortFlipStatus : LPDDHALVPORTCB_GETFLIPSTATUS

}
