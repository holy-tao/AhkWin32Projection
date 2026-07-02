#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHAL_DESTROYDRIVER.ahk" { LPDDHAL_DESTROYDRIVER }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DESTROYDRIVERDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    ddRVal : HRESULT

    DestroyDriver : LPDDHAL_DESTROYDRIVER

}
