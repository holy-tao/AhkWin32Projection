#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS1 extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG1_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG1_SEPARATE_COLOUR_PLANE_SUPPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG1_SEPARATE_COLOUR_PLANE_REQUIRED => 2
}
