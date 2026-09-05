#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE_32x32
     * @type {Integer (Int32)}
     */
    static 32x32 => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE_64x64
     * @type {Integer (Int32)}
     */
    static 64x64 => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE_128x128
     * @type {Integer (Int32)}
     */
    static 128x128 => 3

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE_256x256
     * @type {Integer (Int32)}
     */
    static 256x256 => 4
}
