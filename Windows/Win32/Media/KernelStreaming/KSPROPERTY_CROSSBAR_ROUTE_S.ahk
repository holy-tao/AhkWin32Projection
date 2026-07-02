#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CROSSBAR_ROUTE_S {
    #StructPack 8

    Property : KSIDENTIFIER

    IndexInputPin : UInt32

    IndexOutputPin : UInt32

    CanRoute : UInt32

}
