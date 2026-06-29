#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_NABTS_SUBSTREAMS.ahk" { VBICODECFILTERING_NABTS_SUBSTREAMS }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Substreams : VBICODECFILTERING_NABTS_SUBSTREAMS

}
