#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_KEY_FRAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_INTER_FRAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_INTRA_ONLY_FRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAG_SWITCH_FRAME => 8
}
