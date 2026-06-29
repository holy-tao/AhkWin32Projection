#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_STATUS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    CurrentFrequency : UInt32

    PLLOffset : UInt32

    SignalStrength : UInt32

    Busy : UInt32

}
