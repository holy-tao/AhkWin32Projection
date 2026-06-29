#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_SYNCSURFACEDATA {
    #StructPack 8

    dwSize : UInt32

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    dwSurfaceOffset : UInt32

    fpLockPtr : IntPtr

    lPitch : Int32

    dwOverlayOffset : UInt32

    dwOverlaySrcWidth : UInt32

    dwOverlaySrcHeight : UInt32

    dwOverlayDestWidth : UInt32

    dwOverlayDestHeight : UInt32

    dwDriverReserved1 : IntPtr

    dwDriverReserved2 : IntPtr

    dwDriverReserved3 : IntPtr

    ddRVal : HRESULT

}
