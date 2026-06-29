#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES }

/**
 * Represents codec configuration for H.264 encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264 {
    #StructPack 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_flags.md) enumeration defining the set of enabled codec features.
     */
    ConfigurationFlags : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_direct_modes.md) enumeration specifying direct modes.
     */
    DirectModeConfig : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES](ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_slices_deblocking_modes.md) enumeration specifying configuration related to the disable_deblocking_filter_idc syntax from the H.264 specification.
     */
    DisableDeblockingFilterConfig : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES

}
