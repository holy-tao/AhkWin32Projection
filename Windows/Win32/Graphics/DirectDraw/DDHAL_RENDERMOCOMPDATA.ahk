#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDMCBUFFERINFO.ahk" { DDMCBUFFERINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DDMOTIONCOMP_LCL.ahk" { DDRAWI_DDMOTIONCOMP_LCL }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_RENDERMOCOMPDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_LCL.Ptr

    lpMoComp : DDRAWI_DDMOTIONCOMP_LCL.Ptr

    dwNumBuffers : UInt32

    lpBufferInfo : DDMCBUFFERINFO.Ptr

    dwFunction : UInt32

    lpInputData : IntPtr

    dwInputDataSize : UInt32

    lpOutputData : IntPtr

    dwOutputDataSize : UInt32

    ddRVal : HRESULT

    RenderMoComp : IntPtr

}
