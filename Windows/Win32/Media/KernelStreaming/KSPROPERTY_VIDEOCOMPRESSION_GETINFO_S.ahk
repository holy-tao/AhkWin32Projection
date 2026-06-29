#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
