#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_EIGHTTAP
     * @type {Integer (Int32)}
     */
    static FLAG_EIGHTTAP => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_EIGHTTAP_SMOOTH
     * @type {Integer (Int32)}
     */
    static FLAG_EIGHTTAP_SMOOTH => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_EIGHTTAP_SHARP
     * @type {Integer (Int32)}
     */
    static FLAG_EIGHTTAP_SHARP => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_BILINEAR
     * @type {Integer (Int32)}
     */
    static FLAG_BILINEAR => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAG_SWITCHABLE
     * @type {Integer (Int32)}
     */
    static FLAG_SWITCHABLE => 16
}
