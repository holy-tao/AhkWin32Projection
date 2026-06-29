#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk" { D3D12_VIDEO_ENCODER_LEVELS_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE.ahk" { D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk" { D3D12_VIDEO_ENCODER_LEVEL_SETTING }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Retrieves a value indicating if the specified frame subregion layout mode is supported for the specified code, profile, and level.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_frame_subregion_layout_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which frame subregion layout mode support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which frame subregion layout mode support is being queried.
     */
    Profile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) structure specifying the level for which frame subregion layout mode support is being queried.
     */
    Level : D3D12_VIDEO_ENCODER_LEVEL_SETTING

    /**
     * A member of the [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode.md) enumeration specifying the frame subregion layout mode for which support is being queried.
     */
    SubregionMode : D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE

    /**
     * Receives a boolean value indicating if the specified frame subregion layout mode is supported for the specified codec.
     */
    IsSupported : BOOL

}
