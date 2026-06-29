#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_CC_SUBSTREAMS.ahk" { VBICODECFILTERING_CC_SUBSTREAMS }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_CC_SUBSTREAMS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Substreams : VBICODECFILTERING_CC_SUBSTREAMS

}
