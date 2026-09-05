#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_DISABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DISABLED => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_Q
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_Q => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_LF_Y_V
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_LF_Y_V => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_LF_Y_H
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_LF_Y_H => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_LF_U
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_LF_U => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_LF_V
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_LF_V => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_REF_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_REF_FRAME => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_SKIP
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_SKIP => 128

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAG_ALT_GLOBALMV
     * @type {Integer (Int32)}
     */
    static FLAG_ALT_GLOBALMV => 256
}
