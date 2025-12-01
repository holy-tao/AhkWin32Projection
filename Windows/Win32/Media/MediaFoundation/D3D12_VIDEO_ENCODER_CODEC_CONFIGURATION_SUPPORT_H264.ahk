#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents encoder codec configuration support for H.264 encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_h264_flags.md) specifying which optional features are supported for the codec.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A bitwise OR combination of flags specifying the allowed modes supported for disable_deblocking_filter_idc syntax for H264 spec.
     * @type {Integer}
     */
    DisableDeblockingFilterSupportedModes {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
