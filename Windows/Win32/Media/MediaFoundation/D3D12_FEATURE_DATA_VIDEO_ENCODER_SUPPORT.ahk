#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * Retrieves values indicating support for the specified video encoding features and configuration values.
 * @remarks
 * The support granted or rejected by this query indicates simultaneous support for all the features selected to be used in the same encoding session. There can be features that are supported individually when queried with individual query calls but not supported simultaneously.
 * 
 * For example, there can be support for intra refresh when checking [D3D12_FEATURE_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_feature_video.md) and there can be support for B frames when checking [D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264.MaxL1ReferencesForB](ns-d3d12video-d3d12_video_encoder_codec_picture_control_support_h264.md) > 0. But it can be the case that intra refresh and B frames are not supported simultaneously. In this case, querying **D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT** with CodecGopSequence containing B frames and intra refresh row-based mode, the **D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK** flag will be set off.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which support is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which support is being queried.
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure representing the codec configuration for which support is being queried.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(16, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE](ns-d3d12video-d3d12_video_encoder_sequence_gop_structure.md) structure representing the GOP structure for which support is being queried.
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence{
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(32, this)
            return this.__CodecGopSequence
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_RATE_CONTROL](ns-d3d12video-d3d12_video_encoder_rate_control.md) representing the rate control settings for which support is being queried.
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl{
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(48, this)
            return this.__RateControl
        }
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_video_encoder_intra_refresh_mode.md) enumeration specifying the intra refresh mode for which support is being queried.
     * @type {Integer}
     */
    IntraRefresh {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode.md) enumeration, specifying the subregion layout mode for which support is being queried.
     * @type {Integer}
     */
    SubregionFrameEncoding {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * A UINT specifying the number of resolutions provided in the *pResolutionList* field.
     * @type {Integer}
     */
    ResolutionsListCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * A pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) specifying the picture resolutions for which support is being queried.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>}
     */
    pResolutionList {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A UINT specifying Maximum number of previous reference frames to be used when calling [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) for inter-frames. This value is used to calculate the suggested level returned in the *SuggestedLevel* field.
     * @type {Integer}
     */
    MaxReferenceFramesInDPB {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Receives a bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_VALIDATION_FLAGS](ne-d3d12video-d3d12_video_encoder_validation_flags.md) enumeration that provide additional details if the [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK](ne-d3d12video-d3d12_video_encoder_support_flags.md) flag is not set in the *SupportFlags* field. See **Remarks** for more information.
     * @type {Integer}
     */
    ValidationFlags {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * Receives a bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_encoder_support_flags.md) enumeration specifying support details for the specified encoder features and configuration values.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the recommended profile for the specified encoder features and configuration values.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    SuggestedProfile{
        get {
            if(!this.HasProp("__SuggestedProfile"))
                this.__SuggestedProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(120, this)
            return this.__SuggestedProfile
        }
    }

    /**
     * Receives a [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) specifying the recommended profile for the specified encoder features and configuration values. The recommended level assumes the maximum resolution from the list provided in *pResolutionList*.
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    SuggestedLevel{
        get {
            if(!this.HasProp("__SuggestedLevel"))
                this.__SuggestedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(136, this)
            return this.__SuggestedLevel
        }
    }

    /**
     * Receives a pointer to an array of [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) structures specifying resolution-dependent support limits corresponding to the resolutions provided in *pResolutionList*.
     * @type {Pointer<D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS>}
     */
    pResolutionDependentSupport {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
