#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALMOCOMPCB_GETFORMATS.ahk" { LPDDHALMOCOMPCB_GETFORMATS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETMOCOMPFORMATSDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpGuid : Guid.Ptr

    dwNumFormats : UInt32

    lpFormats : DDPIXELFORMAT.Ptr

    ddRVal : HRESULT

    GetMoCompFormats : LPDDHALMOCOMPCB_GETFORMATS

}
