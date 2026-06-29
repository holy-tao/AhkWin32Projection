#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TunerLockType.ahk" { TunerLockType }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_SCAN_STATUS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    LockStatus : TunerLockType

    CurrentFrequency : UInt32

}
