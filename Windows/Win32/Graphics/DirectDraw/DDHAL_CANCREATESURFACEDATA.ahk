#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CANCREATESURFACEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurfaceDesc : DDSURFACEDESC.Ptr

    bIsDifferentPixelFormat : UInt32

    ddRVal : HRESULT

    CanCreateSurface : IntPtr

}
