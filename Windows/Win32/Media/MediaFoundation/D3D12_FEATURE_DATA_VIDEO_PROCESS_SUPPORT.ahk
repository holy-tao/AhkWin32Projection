#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_FILTER_RANGE.ahk" { D3D12_VIDEO_PROCESS_FILTER_RANGE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_FIELD_TYPE.ahk" { D3D12_VIDEO_FIELD_TYPE }
#Import ".\D3D12_VIDEO_SCALE_SUPPORT.ahk" { D3D12_VIDEO_SCALE_SUPPORT }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_PROCESS_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_PROCESS_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_PROCESS_FEATURE_FLAGS.ahk" { D3D12_VIDEO_PROCESS_FEATURE_FLAGS }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }
#Import ".\D3D12_VIDEO_SCALE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_SCALE_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_PROCESS_FILTER_FLAGS.ahk" { D3D12_VIDEO_PROCESS_FILTER_FLAGS }
#Import ".\D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS.ahk" { D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS }
#Import ".\D3D12_VIDEO_SAMPLE.ahk" { D3D12_VIDEO_SAMPLE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\D3D12_VIDEO_FORMAT.ahk" { D3D12_VIDEO_FORMAT }
#Import ".\D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS.ahk" { D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS }
#Import ".\D3D12_VIDEO_FRAME_STEREO_FORMAT.ahk" { D3D12_VIDEO_FRAME_STEREO_FORMAT }

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_PROCESS_SUPPORT.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_process_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT {
    #StructPack 4

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     */
    NodeIndex : UInt32

    /**
     * A [D3D12\_VIDEO\_SAMPLE](ns-d3d12video-d3d12_video_sample.md) structure defining the width, height, and format of the input sample.
     */
    InputSample : D3D12_VIDEO_SAMPLE

    /**
     * A member of the [D3D12\_VIDEO\_FIELD\_TYPE](ne-d3d12video-d3d12_video_field_type.md) enumeration specifying the interlaced field type of the input sample.
     */
    InputFieldType : D3D12_VIDEO_FIELD_TYPE

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_STEREO\_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifying the stereo format of the input sample.
     */
    InputStereoFormat : D3D12_VIDEO_FRAME_STEREO_FORMAT

    /**
     * The input frame rate.
     */
    InputFrameRate : DXGI_RATIONAL

    /**
     * A [D3D12\_VIDEO\_FORMAT](ns-d3d12video-d3d12_video_format.md) structure specifying the output DXGI format and color space.
     */
    OutputFormat : D3D12_VIDEO_FORMAT

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_STEREO\_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifying the stereo format of the output.
     */
    OutputStereoFormat : D3D12_VIDEO_FRAME_STEREO_FORMAT

    /**
     * The output frame rate.
     */
    OutputFrameRate : DXGI_RATIONAL

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_process_support_flags.md) indicating whether the requested format and colorspace conversion is supported. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    SupportFlags : D3D12_VIDEO_PROCESS_SUPPORT_FLAGS

    /**
     * A [D3D12\_VIDEO\_SCALE\_SUPPORT](ns-d3d12video-d3d12_video_scale_support.md) structure specifying the supported scaling capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    ScaleSupport : D3D12_VIDEO_SCALE_SUPPORT

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FEATURE\_FLAGS](ne-d3d12video-d3d12_video_process_feature_flags.md) enumeration specifying the supported video processing features. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    FeatureSupport : D3D12_VIDEO_PROCESS_FEATURE_FLAGS

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_DEINTERLACE\_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the supported deinterlacing capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    DeinterlaceSupport : D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_AUTO\_PROCESSING\_FLAGS](ne-d3d12video-d3d12_video_process_auto_processing_flags.md) specifying the supported automatic processing capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    AutoProcessingSupport : D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FILTER\_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the supported video filtering features. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    FilterSupport : D3D12_VIDEO_PROCESS_FILTER_FLAGS

    /**
     * An array of [D3D12\_VIDEO\_PROCESS\_FILTER\_RANGE](ns-d3d12video-d3d12_video_process_filter_range.md) structures representing the filter range values.  This value is populated by the call to **ID3D12Device::CheckFeatureSupport**. The calling application must allocate the memory for the filter range list before calling **CheckFeatureSupport**.
     */
    FilterRangeSupport : D3D12_VIDEO_PROCESS_FILTER_RANGE[32]

}
