#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Retrieves the picture control support for the specified codec and profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_codec_picture_control_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which picture control support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which picture control support is being queried.
     */
    Profile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * Gets a boolean value indicating if the provided values are supported.
     */
    IsSupported : BOOL

    /**
     * Receives a [D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT](ns-d3d12video-d3d12_video_encoder_codec_picture_control_support.md) structure representing the picture control support for the provided values.
     */
    PictureSupport : D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT

}
