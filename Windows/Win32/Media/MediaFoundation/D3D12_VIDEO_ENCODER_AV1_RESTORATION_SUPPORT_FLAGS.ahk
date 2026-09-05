#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAG_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_NOT_SUPPORTED => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAG_32x32
     * @type {Integer (Int32)}
     */
    static FLAG_32x32 => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAG_64x64
     * @type {Integer (Int32)}
     */
    static FLAG_64x64 => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAG_128x128
     * @type {Integer (Int32)}
     */
    static FLAG_128x128 => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAG_256x256
     * @type {Integer (Int32)}
     */
    static FLAG_256x256 => 8
}
