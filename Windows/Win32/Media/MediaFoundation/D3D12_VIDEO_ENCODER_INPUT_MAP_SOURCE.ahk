#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE_CPU_BUFFER
     * @type {Integer (Int32)}
     */
    static CPU_BUFFER => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE_GPU_TEXTURE
     * @type {Integer (Int32)}
     */
    static GPU_TEXTURE => 1
}
