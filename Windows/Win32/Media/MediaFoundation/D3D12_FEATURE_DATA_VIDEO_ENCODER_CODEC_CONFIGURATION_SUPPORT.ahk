#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC }

/**
 * Retrieves a value indicating if the specified codec configuration support parameters are supported for the provided HEVC encoding configuration or retrieves the supported configuration for H.264 encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_codec_configuration_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which rate control mode support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which intra refresh mode support is being queried.
     */
    Profile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * Receives a boolean value indicating if the specified configuration parameters are supported for the specified codec.
     */
    IsSupported : BOOL

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT](ns-d3d12video-d3d12_video_encoder_codec_configuration_support.md) structure. For HEVC, the caller populates this structure with the desired encoder configuration. For H.264, the **CheckFeatureSupport** call populates the structure with the supported configuration.
     */
    CodecSupportLimits : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT

}
