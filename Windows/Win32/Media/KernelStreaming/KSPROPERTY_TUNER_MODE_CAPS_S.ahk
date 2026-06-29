#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_MODE_CAPS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Mode : UInt32

    StandardsSupported : UInt32

    MinFrequency : UInt32

    MaxFrequency : UInt32

    TuningGranularity : UInt32

    NumberOfInputs : UInt32

    SettlingTime : UInt32

    Strategy : UInt32

}
