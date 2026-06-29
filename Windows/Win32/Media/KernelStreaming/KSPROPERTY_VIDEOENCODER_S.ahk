#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEOENCODER_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Value : Int32

    Flags : UInt32

    Capabilities : UInt32

}
