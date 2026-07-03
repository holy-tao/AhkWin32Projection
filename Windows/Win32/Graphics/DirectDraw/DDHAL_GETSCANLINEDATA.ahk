#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHAL_GETSCANLINE.ahk" { LPDDHAL_GETSCANLINE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETSCANLINEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    dwScanLine : UInt32

    ddRVal : HRESULT

    GetScanLine : LPDDHAL_GETSCANLINE

}
