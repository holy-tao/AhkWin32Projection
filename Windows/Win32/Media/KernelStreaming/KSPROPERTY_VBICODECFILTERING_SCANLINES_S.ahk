#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import ".\VBICODECFILTERING_SCANLINES.ahk" { VBICODECFILTERING_SCANLINES }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_SCANLINES_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Scanlines : VBICODECFILTERING_SCANLINES

}
