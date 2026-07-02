#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VRAM_SURFACE_INFO.ahk" { VRAM_SURFACE_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VRAM_SURFACE_INFO_PROPERTY_S {
    #StructPack 8

    Property : KSIDENTIFIER

    pVramSurfaceInfo : VRAM_SURFACE_INFO.Ptr

}
