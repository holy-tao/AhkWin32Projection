#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAG_ONLY4x4
     * @type {Integer (Int32)}
     */
    static FLAG_ONLY4x4 => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAG_LARGEST
     * @type {Integer (Int32)}
     */
    static FLAG_LARGEST => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAG_SELECT
     * @type {Integer (Int32)}
     */
    static FLAG_SELECT => 4
}
