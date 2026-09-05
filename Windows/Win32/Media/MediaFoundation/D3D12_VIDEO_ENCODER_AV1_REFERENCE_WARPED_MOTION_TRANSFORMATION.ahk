#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_TRANSLATION
     * @type {Integer (Int32)}
     */
    static TRANSLATION => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_ROTZOOM
     * @type {Integer (Int32)}
     */
    static ROTZOOM => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_AFFINE
     * @type {Integer (Int32)}
     */
    static AFFINE => 3
}
