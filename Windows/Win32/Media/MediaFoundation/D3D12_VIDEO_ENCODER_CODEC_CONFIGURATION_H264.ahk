#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents codec configuration for H.264 encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_flags.md) enumeration defining the set of enabled codec features.
     * @type {Integer}
     */
    ConfigurationFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_direct_modes.md) enumeration specifying direct modes.
     * @type {Integer}
     */
    DirectModeConfig {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_slices_deblocking_modes.md) enumeration specifying configuration related to the disable_deblocking_filter_idc syntax from the H.264 specification.
     * @type {Integer}
     */
    DisableDeblockingFilterConfig {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
