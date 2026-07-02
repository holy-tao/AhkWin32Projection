#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_NABTS_SUBSTREAMS.ahk" { VBICODECFILTERING_NABTS_SUBSTREAMS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Substreams : VBICODECFILTERING_NABTS_SUBSTREAMS

}
