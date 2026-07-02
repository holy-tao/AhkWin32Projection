#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDMOTIONCOMP_LCL.ahk" { DDRAWI_DDMOTIONCOMP_LCL }
#Import ".\LPDDHALMOCOMPCB_BEGINFRAME.ahk" { LPDDHALMOCOMPCB_BEGINFRAME }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_BEGINMOCOMPFRAMEDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpMoComp : DDRAWI_DDMOTIONCOMP_LCL.Ptr

    lpDestSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    dwInputDataSize : UInt32

    lpInputData : IntPtr

    dwOutputDataSize : UInt32

    lpOutputData : IntPtr

    ddRVal : HRESULT

    BeginMoCompFrame : LPDDHALMOCOMPCB_BEGINFRAME

}
