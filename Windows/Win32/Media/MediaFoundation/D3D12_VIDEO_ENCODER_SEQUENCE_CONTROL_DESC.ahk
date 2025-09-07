#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INTRA_REFRESH.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk

/**
 * The D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC represents parameters for the input of the video encoding operation at a sequence level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_sequence_control_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAGS](ne-d3d12video-d3d12_video_encoder_sequence_control_flags.md) enumeration specifying the sequence control descriptor flags for the current operation.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_INTRA_REFRESH](ns-d3d12video-d3d12_video_encoder_intra_refresh.md) structure specifying the parameters for the intra-refresh mode that should be used when triggering intra-refresh sessions.
     * 
     * The use of bidirectional reference frames (B Frames) is mutually exclusive with intra-refresh. Callers should verify that the GOP structure doesn't contain B frames if intra-refresh modes are active. When querying for [D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT](ns-d3d12video-d3d12_feature_data_video_encoder_support.md) with an intra-refresh mode other than [D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_NONE](ns-d3d12video-d3d12_feature_data_video_encoder_intra_refresh_mode.md), the specified [D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE](/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_sequence_gop_structure) set must not contain B frames, or the query will return no support.
     * 
     * The usage of infinite intra-refresh is possible by requesting periodically a new wave of intra-refresh after each of them finishes.
     * 
     * When starting an intra-refresh of N frames of duration, the hosts sets the corresponding picture control flag to start intra-refresh and controls the frame index between [0..N) also in the picture control structure to hint the driver about the progress about the intra refresh session.
     * 
     * Expected behaviour when explicitly requesting an intra refresh wave with duration N frames:
     * 
     *  - If the request for intra-refresh happens at the beginning of a GOP, the intra refresh ocurrs for N frames and then a new GOP is started with an I frame.
     * 
     *  - If the request for intra-refresh happens in the middle of a GOP, the group of pictures will be ended until the last **EncodeFrame** command submitted and restarted after the intra-refresh session with a new GOP starting with an I frame. For example, when the GOP is IPPPP...IPPPP..., if the intra-refresh start is requested at the "IPP" partial submission of the GOP, the last two P frames of that GOP will be ignored, the intra-refresh session will be issued for the N next frames and then a new key-frame that restarts the GOP structure is expected.
     * 
     *  - For row-based intra-refresh, the configured GOP structure will have to be reconfigured to Infinite IPPP...P... GOP (GOPLength = 0u and PPicturePeriod = 1u) for the duration of the intra refresh session. It can then be reconfigured again after the IR wave finished.
     *     
     *  - For row based intra-refresh, the configured subregion partitioning mode will be reconfigured to correspond with N uniform slices partitioning per frame for a duration of N **EncodeFrame** commands. This is particularly important for when the subregion partitioning is set to an incompatible mode with IR requirements, for example when the row of intra coded units in a slice will disrupt the limitation set to bytes per slice. The expectation for row-based intra refresh is that the resulting frame contains N slices, all P slices, except the current intra refresh row slice, which has to be an I slice.
     * @type {D3D12_VIDEO_ENCODER_INTRA_REFRESH}
     */
    IntraRefreshConfig{
        get {
            if(!this.HasProp("__IntraRefreshConfig"))
                this.__IntraRefreshConfig := D3D12_VIDEO_ENCODER_INTRA_REFRESH(this.ptr + 8)
            return this.__IntraRefreshConfig
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_RATE_CONTROL](ns-d3d12video-d3d12_video_encoder_rate_control.md) structure specifying the rate control configuration.
     * 
     * Check support for rate control dynamic reconfiguration in [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_RECONFIGURATION_AVAILABLE](ne-d3d12video-d3d12_video_encoder_support_flags.md). If rate control dynamic reconfiguration is allowed, by modifying *RateControl*, the rate control algorithm is restarted with the new configuration starting from the execution of the associated **EncodeFrame**. Otherwise this should be set at the beginning of the encoding session and not changed after.
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl{
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(this.ptr + 16)
            return this.__RateControl
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structure describing the resolution to use when encoding this frame.
     * 
     * Check support for resolution dynamic reconfiguration in [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RESOLUTION_RECONFIGURATION_AVAILABLE](ne-d3d12video-d3d12_video_encoder_support_flags.md). If no support is given for this, *PictureTargetResolution* indicates the target resolution of the full encoding session and must not be changed during the encoding session. Otherwise this indicates the resolution used for the associated **EncodeFrame** command.
     * 
     * The target must be set based on the list of resolutions specified when creating the associated encoder heap for this operation.
     * 
     * For some codecs, A change in resolution in the middle of the encoding session might require a GOP to be reset with a potential force IDR/Key frame request, and also might require resetting the DPB buffer/frame management algorithms.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    PictureTargetResolution{
        get {
            if(!this.HasProp("__PictureTargetResolution"))
                this.__PictureTargetResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 48)
            return this.__PictureTargetResolution
        }
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode.md) enumeration specifying which layout mode is being used and therefore which union members to use in *pFrameSubregionsLayoutData*.
     * 
     * Check support for subregion dynamic reconfiguration in [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_LAYOUT_RECONFIGURATION_AVAILABLE]((ne-d3d12video-d3d12_video_encoder_support_flags.md). If no support is given for this, this indicates the target subregion mode of the full encoding session and must not be changed during the encoding session. Otherwise this indicates the subregion partitioning mode used for the associated **EncodeFrame** command.
     * @type {Integer}
     */
    SelectedLayoutMode {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA](ns-d3d12video-d3d12_video_encoder_picture_control_subregions_layout_data.md) structure specifying picture subregions layout optional codec-specific data. If the specified *SelectedLayoutMode* value indicates that such that there are no subregions, null is expected.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    FrameSubregionsLayoutData{
        get {
            if(!this.HasProp("__FrameSubregionsLayoutData"))
                this.__FrameSubregionsLayoutData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA(this.ptr + 64)
            return this.__FrameSubregionsLayoutData
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE](/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_sequence_gop_structure) structure specifying the current GOP used in the video sequence, in display order. Calls to [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) must follow this GOP but in encode order after B-Frames reordering.
     * 
     * Check support for GOP dynamic reconfiguration in [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SEQUENCE_GOP_RECONFIGURATION_AVAILABLE](ne-d3d12video-d3d12_video_encoder_support_flags.md). If no support is given for this, *CodecGopSequence* indicates the target GOP pattern (in display order) of the full encoding session and must not be changed during the encoding session. Otherwise this indicates the new GOP subregion mode used starting at the associated **EncodeFrame** command.
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence{
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(this.ptr + 80)
            return this.__CodecGopSequence
        }
    }
}
