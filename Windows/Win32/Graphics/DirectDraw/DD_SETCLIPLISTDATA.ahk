#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SETCLIPLISTDATA {
    #StructPack 8

    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    lpDDSurface : DD_SURFACE_LOCAL.Ptr

    ddRVal : HRESULT

    SetClipList : IntPtr

}
