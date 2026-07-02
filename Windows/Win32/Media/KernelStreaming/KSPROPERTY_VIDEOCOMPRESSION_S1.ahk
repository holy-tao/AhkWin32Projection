#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEOCOMPRESSION_S1 {
    #StructPack 8

    Property : KSIDENTIFIER

    StreamIndex : UInt32

    Value : Int32

    Flags : UInt32

}
