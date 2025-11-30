#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOVEREGION_INFO_FLAG_MULTIPLE_HINTS => 1
}
