#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_INPUT_MAP_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_INPUT_MAP_TYPE_QUANTIZATION_MATRIX
     * @type {Integer (Int32)}
     */
    static QUANTIZATION_MATRIX => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_INPUT_MAP_TYPE_DIRTY_REGIONS
     * @type {Integer (Int32)}
     */
    static DIRTY_REGIONS => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_INPUT_MAP_TYPE_MOTION_VECTORS
     * @type {Integer (Int32)}
     */
    static MOTION_VECTORS => 2
}
