#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_SCAN_CAPS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    fSupportsHardwareAssistedScanning : BOOL

    SupportedBroadcastStandards : UInt32

    GUIDBucket : IntPtr

    lengthofBucket : UInt32

}
