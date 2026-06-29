#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS.ahk" { D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_PROCESS_FILTER_FLAGS.ahk" { D3D12_VIDEO_PROCESS_FILTER_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_PROCESS_FEATURE_FLAGS.ahk" { D3D12_VIDEO_PROCESS_FEATURE_FLAGS }

/**
 * Retrieves the number of past and future reference frames required for the specified deinterlace mode, filter, rate conversion, or auto processing features.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_process_reference_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO {
    #StructPack 4

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_DEINTERLACE\_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the deinterlacing mode for which the required past and future reference frame counts are retrieved.
     */
    DeinterlaceMode : D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FILTER\_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the filters for which the required past and future reference frame counts are retrieved.
     */
    Filters : D3D12_VIDEO_PROCESS_FILTER_FLAGS

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FEATURE\_FLAGS](ne-d3d12video-d3d12_video_process_feature_flags.md) enumeration specifying the features for which the required past and future reference frame counts are retrieved.
     */
    FeatureSupport : D3D12_VIDEO_PROCESS_FEATURE_FLAGS

    /**
     * The input frame rate of the stream for which the required past and future reference frame counts are retrieved.
     */
    InputFrameRate : DXGI_RATIONAL

    /**
     * The output frame rate of the stream for which the required past and future reference frame counts are retrieved.
     */
    OutputFrameRate : DXGI_RATIONAL

    /**
     * True if autoprocessing will be used; otherwise, false.
     */
    EnableAutoProcessing : BOOL

    /**
     * The number of past frames required to support the specified processing features.
     */
    PastFrames : UInt32

    /**
     * The number of future frames required to support the specified processing features.
     */
    FutureFrames : UInt32

}
