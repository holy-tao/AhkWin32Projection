#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWPALETTE_GBL.ahk" { DDRAWI_DDRAWPALETTE_GBL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_SETENTRIESDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDPalette : DDRAWI_DDRAWPALETTE_GBL.Ptr

    dwBase : UInt32

    dwNumEntries : UInt32

    lpEntries : PALETTEENTRY.Ptr

    ddRVal : HRESULT

    SetEntries : IntPtr

}
