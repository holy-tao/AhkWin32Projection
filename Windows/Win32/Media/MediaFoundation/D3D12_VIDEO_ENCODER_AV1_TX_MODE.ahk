#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_TX_MODE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_ONLY4x4
     * @type {Integer (Int32)}
     */
    static ONLY4x4 => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_LARGEST
     * @type {Integer (Int32)}
     */
    static LARGEST => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_TX_MODE_SELECT
     * @type {Integer (Int32)}
     */
    static SELECT => 2
}
