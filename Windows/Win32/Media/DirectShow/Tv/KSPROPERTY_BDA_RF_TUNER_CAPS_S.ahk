#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSP_NODE.ahk" { KSP_NODE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_RF_TUNER_CAPS_S {
    #StructPack 8

    Property : KSP_NODE

    Mode : UInt32

    AnalogStandardsSupported : UInt32

    DigitalStandardsSupported : UInt32

    MinFrequency : UInt32

    MaxFrequency : UInt32

    SettlingTime : UInt32

    AnalogSensingRange : UInt32

    DigitalSensingRange : UInt32

    MilliSecondsPerMHz : UInt32

}
