#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_KEY_FRAME
     * @type {Integer (Int32)}
     */
    static KEY_FRAME => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_INTER_FRAME
     * @type {Integer (Int32)}
     */
    static INTER_FRAME => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_INTRA_ONLY_FRAME
     * @type {Integer (Int32)}
     */
    static INTRA_ONLY_FRAME => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_SWITCH_FRAME
     * @type {Integer (Int32)}
     */
    static SWITCH_FRAME => 3
}
