#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_KEY_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_KEY_FRAME => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_INTER_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_INTER_FRAME => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_INTRA_ONLY_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_INTRA_ONLY_FRAME => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_SWITCH_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_SWITCH_FRAME => 8
}
