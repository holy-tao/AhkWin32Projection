#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAGS extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAG_MULTIPLE_HINTS
     * @type {Integer (Int32)}
     */
    static FLAG_MULTIPLE_HINTS => 1
}
