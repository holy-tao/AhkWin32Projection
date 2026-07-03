#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEOCOMPRESSION_GETINFO_S {
    #StructPack 8

    Property : KSIDENTIFIER

    StreamIndex : UInt32

    DefaultKeyFrameRate : Int32

    DefaultPFrameRate : Int32

    DefaultQuality : Int32

    NumberOfQualitySettings : Int32

    Capabilities : Int32

}
