#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_METADATA_ITEMHEADER.ahk" { KSCAMERA_METADATA_ITEMHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_METADATA_CAPTURESTATS {
    #StructPack 8

    Header : KSCAMERA_METADATA_ITEMHEADER

    Flags : UInt32

    Reserved : UInt32

    ExposureTime : Int64

    ExposureCompensationFlags : Int64

    ExposureCompensationValue : Int32

    IsoSpeed : UInt32

    FocusState : UInt32

    LensPosition : UInt32

    WhiteBalance : UInt32

    Flash : UInt32

    FlashPower : UInt32

    ZoomFactor : UInt32

    SceneMode : Int64

    SensorFramerate : Int64

}
