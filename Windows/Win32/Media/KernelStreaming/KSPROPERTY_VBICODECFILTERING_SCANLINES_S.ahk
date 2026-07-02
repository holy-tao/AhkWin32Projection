#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VBICODECFILTERING_SCANLINES.ahk" { VBICODECFILTERING_SCANLINES }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_SCANLINES_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Scanlines : VBICODECFILTERING_SCANLINES

}
