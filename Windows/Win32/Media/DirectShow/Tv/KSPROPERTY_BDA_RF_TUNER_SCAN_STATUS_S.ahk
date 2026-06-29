#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSP_NODE.ahk" { KSP_NODE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS_S {
    #StructPack 8

    Property : KSP_NODE

    CurrentFrequency : UInt32

    FrequencyRangeMin : UInt32

    FrequencyRangeMax : UInt32

    MilliSecondsLeft : UInt32

}
