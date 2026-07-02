#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALVPORTCB_GETVPORTCONNECT.ahk" { LPDDHALVPORTCB_GETVPORTCONNECT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETVPORTCONNECTDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    dwPortId : UInt32

    lpConnect : DDVIDEOPORTCONNECT.Ptr

    dwNumEntries : UInt32

    ddRVal : HRESULT

    GetVideoPortConnectInfo : LPDDHALVPORTCB_GETVPORTCONNECT

}
