#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_ERROR_RESILIENT_MODE
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_ERROR_RESILIENT_MODE => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_DISABLE_CDF_UPDATE
     * @type {Integer (Int32)}
     */
    static FLAG_DISABLE_CDF_UPDATE => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_PALETTE_ENCODING
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_PALETTE_ENCODING => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_SKIP_MODE
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_SKIP_MODE => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_FRAME_REFERENCE_MOTION_VECTORS
     * @type {Integer (Int32)}
     */
    static FLAG_FRAME_REFERENCE_MOTION_VECTORS => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_FORCE_INTEGER_MOTION_VECTORS
     * @type {Integer (Int32)}
     */
    static FLAG_FORCE_INTEGER_MOTION_VECTORS => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ALLOW_INTRA_BLOCK_COPY
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_INTRA_BLOCK_COPY => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_USE_SUPER_RESOLUTION
     * @type {Integer (Int32)}
     */
    static FLAG_USE_SUPER_RESOLUTION => 128

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_DISABLE_FRAME_END_UPDATE_CDF
     * @type {Integer (Int32)}
     */
    static FLAG_DISABLE_FRAME_END_UPDATE_CDF => 256

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_FRAME_SEGMENTATION_AUTO
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_FRAME_SEGMENTATION_AUTO => 512

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_FRAME_SEGMENTATION_CUSTOM
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_FRAME_SEGMENTATION_CUSTOM => 1024

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ENABLE_WARPED_MOTION
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_WARPED_MOTION => 2048

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_REDUCED_TX_SET
     * @type {Integer (Int32)}
     */
    static FLAG_REDUCED_TX_SET => 4096

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_MOTION_MODE_SWITCHABLE
     * @type {Integer (Int32)}
     */
    static FLAG_MOTION_MODE_SWITCHABLE => 8192

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_FLAG_ALLOW_HIGH_PRECISION_MV
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_HIGH_PRECISION_MV => 16384
}
