#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_MetadataId{

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_Standard_Start => 1

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_PhotoConfirmation => 1

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_UsbVideoHeader => 2

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_CaptureStats => 3

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_CameraExtrinsics => 4

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_CameraIntrinsics => 5

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_FrameIllumination => 6

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_DigitalWindow => 7

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_BackgroundSegmentationMask => 8

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_Standard_End => 8

    /**
     * @type {Integer (Int32)}
     */
    static MetadataId_Custom_Start => -2147483648
}
