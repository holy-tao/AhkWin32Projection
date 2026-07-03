#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWPALETTE_GBL.ahk" { DDRAWI_DDRAWPALETTE_GBL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHAL_CREATEPALETTE.ahk" { LPDDHAL_CREATEPALETTE }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CREATEPALETTEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDPalette : DDRAWI_DDRAWPALETTE_GBL.Ptr

    lpColorTable : PALETTEENTRY.Ptr

    ddRVal : HRESULT

    CreatePalette : LPDDHAL_CREATEPALETTE

    is_excl : BOOL

}
