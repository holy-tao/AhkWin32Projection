#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_FRAME_INPUT_MOTION_UNIT_PRECISION extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_INPUT_MOTION_UNIT_PRECISION_FULL_PIXEL
     * @type {Integer (Int32)}
     */
    static FULL_PIXEL => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_INPUT_MOTION_UNIT_PRECISION_HALF_PIXEL
     * @type {Integer (Int32)}
     */
    static HALF_PIXEL => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_INPUT_MOTION_UNIT_PRECISION_QUARTER_PIXEL
     * @type {Integer (Int32)}
     */
    static QUARTER_PIXEL => 2
}
