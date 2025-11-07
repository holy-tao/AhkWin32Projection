#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the motion estimation search block sizes that a video encoder can support.
 * @remarks
 * 
 * Query for supported block sizes by calling [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) and specifying the feature value of [D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR](ne-d3d12video-d3d12_feature_video.md).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_motion_estimator_search_block_size_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAGS{

    /**
     * Search block size is not supported by the encoder.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_NONE => 0

    /**
     * The encoder supports a search block size of 8x8 pixels.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_8X8 => 1

    /**
     * The encoder supports a search block size of 16x16 pixels.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_16X16 => 2
}
