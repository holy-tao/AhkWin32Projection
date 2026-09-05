#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_MetadataId extends Win32Enum {

    /**
     * Native name: MetadataId_Standard_Start
     * @type {Integer (Int32)}
     */
    static Standard_Start => 1

    /**
     * Native name: MetadataId_PhotoConfirmation
     * @type {Integer (Int32)}
     */
    static PhotoConfirmation => 1

    /**
     * Native name: MetadataId_UsbVideoHeader
     * @type {Integer (Int32)}
     */
    static UsbVideoHeader => 2

    /**
     * Native name: MetadataId_CaptureStats
     * @type {Integer (Int32)}
     */
    static CaptureStats => 3

    /**
     * Native name: MetadataId_CameraExtrinsics
     * @type {Integer (Int32)}
     */
    static CameraExtrinsics => 4

    /**
     * Native name: MetadataId_CameraIntrinsics
     * @type {Integer (Int32)}
     */
    static CameraIntrinsics => 5

    /**
     * Native name: MetadataId_FrameIllumination
     * @type {Integer (Int32)}
     */
    static FrameIllumination => 6

    /**
     * Native name: MetadataId_DigitalWindow
     * @type {Integer (Int32)}
     */
    static DigitalWindow => 7

    /**
     * Native name: MetadataId_BackgroundSegmentationMask
     * @type {Integer (Int32)}
     */
    static BackgroundSegmentationMask => 8

    /**
     * Native name: MetadataId_Standard_End
     * @type {Integer (Int32)}
     */
    static Standard_End => 8

    /**
     * Native name: MetadataId_Custom_Start
     * @type {Integer (Int32)}
     */
    static Custom_Start => -2147483648
}
