#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWPALETTE_GBL.ahk" { DDRAWI_DDRAWPALETTE_GBL }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHALSURFCB_SETPALETTE.ahk" { LPDDHALSURFCB_SETPALETTE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_SETPALETTEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    lpDDPalette : DDRAWI_DDRAWPALETTE_GBL.Ptr

    ddRVal : HRESULT

    SetPalette : LPDDHALSURFCB_SETPALETTE

    Attach : BOOL

}
