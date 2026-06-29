#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAGS }

/**
 * Represents encoder codec configuration support for H.264 encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264 {
    #StructPack 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_h264_flags.md) specifying which optional features are supported for the codec.
     */
    SupportFlags : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS

    /**
     * A bitwise OR combination of flags specifying the allowed modes supported for disable_deblocking_filter_idc syntax for H264 spec.
     */
    DisableDeblockingFilterSupportedModes : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAGS

}
