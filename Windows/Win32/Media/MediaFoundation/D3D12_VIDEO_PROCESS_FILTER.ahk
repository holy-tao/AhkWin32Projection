#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROCESS_FILTER extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS => 0

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_CONTRAST
     * @type {Integer (Int32)}
     */
    static CONTRAST => 1

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_HUE
     * @type {Integer (Int32)}
     */
    static HUE => 2

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_SATURATION
     * @type {Integer (Int32)}
     */
    static SATURATION => 3

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_NOISE_REDUCTION
     * @type {Integer (Int32)}
     */
    static NOISE_REDUCTION => 4

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_EDGE_ENHANCEMENT
     * @type {Integer (Int32)}
     */
    static EDGE_ENHANCEMENT => 5

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_ANAMORPHIC_SCALING
     * @type {Integer (Int32)}
     */
    static ANAMORPHIC_SCALING => 6

    /**
     * Native name: D3D12_VIDEO_PROCESS_FILTER_STEREO_ADJUSTMENT
     * @type {Integer (Int32)}
     */
    static STEREO_ADJUSTMENT => 7
}
