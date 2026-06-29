#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_FREQUENCY_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Frequency : UInt32

    LastFrequency : UInt32

    TuningFlags : UInt32

    VideoSubChannel : UInt32

    AudioSubChannel : UInt32

    Channel : UInt32

    Country : UInt32

}
