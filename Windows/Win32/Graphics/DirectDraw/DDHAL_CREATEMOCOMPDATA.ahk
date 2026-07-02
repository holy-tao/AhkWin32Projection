#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDMOTIONCOMP_LCL.ahk" { DDRAWI_DDMOTIONCOMP_LCL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDHALMOCOMPCB_CREATE.ahk" { LPDDHALMOCOMPCB_CREATE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_CREATEMOCOMPDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpMoComp : DDRAWI_DDMOTIONCOMP_LCL.Ptr

    lpGuid : Guid.Ptr

    dwUncompWidth : UInt32

    dwUncompHeight : UInt32

    ddUncompPixelFormat : DDPIXELFORMAT

    lpData : IntPtr

    dwDataSize : UInt32

    ddRVal : HRESULT

    CreateMoComp : LPDDHALMOCOMPCB_CREATE

}
