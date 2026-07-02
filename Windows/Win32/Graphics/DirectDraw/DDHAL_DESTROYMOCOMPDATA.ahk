#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDMOTIONCOMP_LCL.ahk" { DDRAWI_DDMOTIONCOMP_LCL }
#Import ".\LPDDHALMOCOMPCB_DESTROY.ahk" { LPDDHALMOCOMPCB_DESTROY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DESTROYMOCOMPDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpMoComp : DDRAWI_DDMOTIONCOMP_LCL.Ptr

    ddRVal : HRESULT

    DestroyMoComp : LPDDHALMOCOMPCB_DESTROY

}
