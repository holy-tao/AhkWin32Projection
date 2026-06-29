#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDVIDEOPORTINFO.ahk" { DDVIDEOPORTINFO }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_UPDATEVPORTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpVideoPort : DDRAWI_DDVIDEOPORT_LCL.Ptr

    lplpDDSurface : IntPtr

    lplpDDVBISurface : IntPtr

    lpVideoInfo : DDVIDEOPORTINFO.Ptr

    dwFlags : UInt32

    dwNumAutoflip : UInt32

    dwNumVBIAutoflip : UInt32

    ddRVal : HRESULT

    UpdateVideoPort : IntPtr

}
