#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP }
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk" { D3D12_VIDEO_ENCODER_LEVELS_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION }
#Import ".\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE.ahk" { D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE }
#Import ".\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264.ahk" { D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1 }
#Import ".\D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.ahk" { D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264 }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1 }
#Import ".\D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE.ahk" { D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_VALIDATION_FLAGS.ahk" { D3D12_VIDEO_ENCODER_VALIDATION_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk" { D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk" { D3D12_VIDEO_ENCODER_LEVEL_SETTING }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE.ahk" { D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE }
#Import ".\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC.ahk" { D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS }
#Import ".\D3D12_VIDEO_ENCODER_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_ENCODER_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL }

/**
 * Retrieves values indicating support for the specified video encoding features and configuration values.
 * @remarks
 * The support granted or rejected by this query indicates simultaneous support for all the features selected to be used in the same encoding session. There can be features that are supported individually when queried with individual query calls but not supported simultaneously.
 * 
 * For example, there can be support for intra refresh when checking [D3D12_FEATURE_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_feature_video.md) and there can be support for B frames when checking [D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264.MaxL1ReferencesForB](ns-d3d12video-d3d12_video_encoder_codec_picture_control_support_h264.md) > 0. But it can be the case that intra refresh and B frames are not supported simultaneously. In this case, querying **D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT** with CodecGopSequence containing B frames and intra refresh row-based mode, the **D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK** flag will be set off.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which support is being queried.
     */
    InputFormat : DXGI_FORMAT

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure representing the codec configuration for which support is being queried.
     */
    CodecConfiguration : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION

    /**
     * A [D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE](ns-d3d12video-d3d12_video_encoder_sequence_gop_structure.md) structure representing the GOP structure for which support is being queried.
     */
    CodecGopSequence : D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE

    /**
     * A [D3D12_VIDEO_ENCODER_RATE_CONTROL](ns-d3d12video-d3d12_video_encoder_rate_control.md) representing the rate control settings for which support is being queried.
     */
    RateControl : D3D12_VIDEO_ENCODER_RATE_CONTROL

    /**
     * A member of the [D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_video_encoder_intra_refresh_mode.md) enumeration specifying the intra refresh mode for which support is being queried.
     */
    IntraRefresh : D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE

    /**
     * A member of the [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode.md) enumeration, specifying the subregion layout mode for which support is being queried.
     */
    SubregionFrameEncoding : D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE

    /**
     * A UINT specifying the number of resolutions provided in the *pResolutionList* field.
     */
    ResolutionsListCount : UInt32

    /**
     * A pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) specifying the picture resolutions for which support is being queried.
     */
    pResolutionList : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.Ptr

    /**
     * A UINT specifying Maximum number of previous reference frames to be used when calling [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) for inter-frames. This value is used to calculate the suggested level returned in the *SuggestedLevel* field.
     */
    MaxReferenceFramesInDPB : UInt32

    /**
     * Receives a bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_VALIDATION_FLAGS](ne-d3d12video-d3d12_video_encoder_validation_flags.md) enumeration that provide additional details if the [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK](ne-d3d12video-d3d12_video_encoder_support_flags.md) flag is not set in the *SupportFlags* field. See **Remarks** for more information.
     */
    ValidationFlags : D3D12_VIDEO_ENCODER_VALIDATION_FLAGS

    /**
     * Receives a bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_encoder_support_flags.md) enumeration specifying support details for the specified encoder features and configuration values.
     */
    SupportFlags : D3D12_VIDEO_ENCODER_SUPPORT_FLAGS

    /**
     * Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the recommended profile for the specified encoder features and configuration values.
     */
    SuggestedProfile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * Receives a [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) specifying the recommended profile for the specified encoder features and configuration values. The recommended level assumes the maximum resolution from the list provided in *pResolutionList*.
     */
    SuggestedLevel : D3D12_VIDEO_ENCODER_LEVEL_SETTING

    /**
     * Receives a pointer to an array of [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) structures specifying resolution-dependent support limits corresponding to the resolutions provided in *pResolutionList*.
     */
    pResolutionDependentSupport : D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.Ptr

}
