#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSPIN_DATAFLOW.ahk" { KSPIN_DATAFLOW }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CROSSBAR_PININFO_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Direction : KSPIN_DATAFLOW

    Index : UInt32

    PinType : UInt32

    RelatedPinIndex : UInt32

    Medium : KSIDENTIFIER

}
