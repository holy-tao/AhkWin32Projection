#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE_SWITCHABLE
     * @type {Integer (Int32)}
     */
    static SWITCHABLE => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE_WIENER
     * @type {Integer (Int32)}
     */
    static WIENER => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE_SGRPROJ
     * @type {Integer (Int32)}
     */
    static SGRPROJ => 3
}
