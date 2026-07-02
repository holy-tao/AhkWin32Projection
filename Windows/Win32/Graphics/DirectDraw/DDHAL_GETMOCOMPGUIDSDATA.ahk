#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\LPDDHALMOCOMPCB_GETGUIDS.ahk" { LPDDHALMOCOMPCB_GETGUIDS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETMOCOMPGUIDSDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    dwNumGuids : UInt32

    lpGuids : Guid.Ptr

    ddRVal : HRESULT

    GetMoCompGuids : LPDDHALMOCOMPCB_GETGUIDS

}
