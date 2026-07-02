#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALMOCOMPCB_GETCOMPBUFFINFO.ahk" { LPDDHALMOCOMPCB_GETCOMPBUFFINFO }
#Import ".\DDMCCOMPBUFFERINFO.ahk" { DDMCCOMPBUFFERINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETMOCOMPCOMPBUFFDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpGuid : Guid.Ptr

    dwWidth : UInt32

    dwHeight : UInt32

    ddPixelFormat : DDPIXELFORMAT

    dwNumTypesCompBuffs : UInt32

    lpCompBuffInfo : DDMCCOMPBUFFERINFO.Ptr

    ddRVal : HRESULT

    GetMoCompBuffInfo : LPDDHALMOCOMPCB_GETCOMPBUFFINFO

}
