#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\LPDDHALVPORTCB_GETBANDWIDTH.ahk" { LPDDHALVPORTCB_GETBANDWIDTH }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDVIDEOPORTBANDWIDTH.ahk" { DDVIDEOPORTBANDWIDTH }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETVPORTBANDWIDTHDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpVideoPort : DDRAWI_DDVIDEOPORT_LCL.Ptr

    lpddpfFormat : DDPIXELFORMAT.Ptr

    dwWidth : UInt32

    dwHeight : UInt32

    dwFlags : UInt32

    lpBandwidth : DDVIDEOPORTBANDWIDTH.Ptr

    ddRVal : HRESULT

    GetVideoPortBandwidth : LPDDHALVPORTCB_GETBANDWIDTH

}
