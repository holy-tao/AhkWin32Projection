#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE.ahk" { D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION }
#Import ".\D3D12_VIDEO_ENCODER_FLAGS.ahk" { D3D12_VIDEO_ENCODER_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Describes an ID3D12VideoEncoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_DESC {
    #StructPack 8

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_FLAGS](ne-d3d12video-d3d12_video_encoder_flags.md) specifying the flags for encoder creation.
     */
    Flags : D3D12_VIDEO_ENCODER_FLAGS

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the desired codec.
     */
    EncodeCodec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the desired encoding profile.
     */
    EncodeProfile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) specifying the format of the source stream.
     */
    InputFormat : DXGI_FORMAT

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure specifying codec configuration parameters.
     */
    CodecConfiguration : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION

    /**
     * A value from the [D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE](ne-d3d12video-d3d12_video_encoder_motion_estimation_precision_mode.md) enumeration the maximum number of motion vectors allowed.
     */
    MaxMotionEstimationPrecision : D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE

}
