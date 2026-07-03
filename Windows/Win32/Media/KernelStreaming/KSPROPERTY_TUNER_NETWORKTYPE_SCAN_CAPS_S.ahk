#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S {
    #StructPack 8

    Property : KSIDENTIFIER

    NetworkType : Guid

    BufferSize : UInt32

    NetworkTunerCapabilities : IntPtr

}
