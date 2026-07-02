#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }
#Import ".\LPDDHAL_GETAVAILDRIVERMEMORY.ahk" { LPDDHAL_GETAVAILDRIVERMEMORY }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETAVAILDRIVERMEMORYDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    DDSCaps : DDSCAPS

    dwTotal : UInt32

    dwFree : UInt32

    ddRVal : HRESULT

    GetAvailDriverMemory : LPDDHAL_GETAVAILDRIVERMEMORY

    ddsCapsEx : DDSCAPSEX

}
