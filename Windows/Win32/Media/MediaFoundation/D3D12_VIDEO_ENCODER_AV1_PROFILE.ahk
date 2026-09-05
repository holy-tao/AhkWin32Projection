#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_PROFILE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PROFILE_MAIN
     * @type {Integer (Int32)}
     */
    static MAIN => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PROFILE_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_PROFILE_PROFESSIONAL
     * @type {Integer (Int32)}
     */
    static PROFESSIONAL => 2
}
