#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_EIGHTTAP
     * @type {Integer (Int32)}
     */
    static EIGHTTAP => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_EIGHTTAP_SMOOTH
     * @type {Integer (Int32)}
     */
    static EIGHTTAP_SMOOTH => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_EIGHTTAP_SHARP
     * @type {Integer (Int32)}
     */
    static EIGHTTAP_SHARP => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_BILINEAR
     * @type {Integer (Int32)}
     */
    static BILINEAR => 3

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_SWITCHABLE
     * @type {Integer (Int32)}
     */
    static SWITCHABLE => 4
}
