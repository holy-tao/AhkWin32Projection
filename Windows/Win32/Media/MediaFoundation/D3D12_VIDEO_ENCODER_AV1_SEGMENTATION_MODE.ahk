#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_Q
     * @type {Integer (Int32)}
     */
    static ALT_Q => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_Y_V
     * @type {Integer (Int32)}
     */
    static ALT_LF_Y_V => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_Y_H
     * @type {Integer (Int32)}
     */
    static ALT_LF_Y_H => 3

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_U
     * @type {Integer (Int32)}
     */
    static ALT_LF_U => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_V
     * @type {Integer (Int32)}
     */
    static ALT_LF_V => 5

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_REF_FRAME
     * @type {Integer (Int32)}
     */
    static ALT_REF_FRAME => 6

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_SKIP
     * @type {Integer (Int32)}
     */
    static ALT_SKIP => 7

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_GLOBALMV
     * @type {Integer (Int32)}
     */
    static ALT_GLOBALMV => 8
}
