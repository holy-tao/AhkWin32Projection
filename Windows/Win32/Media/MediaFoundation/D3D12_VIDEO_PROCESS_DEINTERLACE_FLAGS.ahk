#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the deinterlacing video processor capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_deinterlace_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS{

    /**
     * No deinterlacing capabilities are available.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_NONE => 0

    /**
     * The video processor can perform bob deinterlacing. In bob deinterlacing, missing field lines are interpolated from the lines above and below. Bob deinterlacing does not require reference frames.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_BOB => 1

    /**
     * The video processor can perform a custom high-quality deinterlacing, which requires the number of reference frames indicated in *PastFrames* and *FutureFrames* output fields of the <a href="ns-d3d12video-d3d12_feature_data_video_process_reference_info.md">D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO</a> populated by a call to <a href="nf-d3d12video-id3d12videodevice-checkfeaturesupport.md">ID3D12VideoDevice::CheckFeatureSupport</a> when the feature specified is <a href="ne-d3d12video-d3d12_feature_video.md">D3D12_FEATURE_VIDEO_PROCESS_REFERENCE_INFO</a>. If the video processor doesn’t have the necessary number of reference frames, it falls back to bob deinterlacing.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_CUSTOM => 2147483648
}
