#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\LPDDHALMOCOMPCB_GETINTERNALINFO.ahk" { LPDDHALMOCOMPCB_GETINTERNALINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETINTERNALMOCOMPDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpGuid : Guid.Ptr

    dwWidth : UInt32

    dwHeight : UInt32

    ddPixelFormat : DDPIXELFORMAT

    dwScratchMemAlloc : UInt32

    ddRVal : HRESULT

    GetInternalMoCompInfo : LPDDHALMOCOMPCB_GETINTERNALINFO

}
