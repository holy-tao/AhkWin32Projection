#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DRVSETCOLORKEYDATA {
    #StructPack 8

    lpDDSurface : DD_SURFACE_LOCAL.Ptr

    dwFlags : UInt32

    ckNew : DDCOLORKEY

    ddRVal : HRESULT

    SetColorKey : IntPtr

}
