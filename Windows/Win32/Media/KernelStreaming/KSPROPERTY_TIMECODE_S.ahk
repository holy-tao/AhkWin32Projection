#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\TIMECODE.ahk" { TIMECODE }
#Import "..\TIMECODE_SAMPLE_FLAGS.ahk" { TIMECODE_SAMPLE_FLAGS }
#Import "..\TIMECODE_SAMPLE.ahk" { TIMECODE_SAMPLE }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TIMECODE_S {
    #StructPack 8

    Property : KSIDENTIFIER

    TimecodeSamp : TIMECODE_SAMPLE

}
