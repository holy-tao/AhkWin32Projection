#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHAL_SETMODE.ahk" { LPDDHAL_SETMODE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_SETMODEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    dwModeIndex : UInt32

    ddRVal : HRESULT

    SetMode : LPDDHAL_SETMODE

    inexcl : BOOL

    useRefreshRate : BOOL

}
