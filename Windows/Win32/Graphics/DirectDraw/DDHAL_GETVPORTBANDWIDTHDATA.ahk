#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTBANDWIDTH.ahk" { DDVIDEOPORTBANDWIDTH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

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

    GetVideoPortBandwidth : IntPtr

}
