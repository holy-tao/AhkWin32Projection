#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\TIMECODE_SAMPLE.ahk" { TIMECODE_SAMPLE }
#Import "..\TIMECODE_SAMPLE_FLAGS.ahk" { TIMECODE_SAMPLE_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\TIMECODE.ahk" { TIMECODE }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TIMECODE_S {
    #StructPack 8

    Property : KSIDENTIFIER

    TimecodeSamp : TIMECODE_SAMPLE

}
