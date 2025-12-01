#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines supported search block sizes for video motion estimation.
 * @remarks
 * Query for supported block sizes by calling [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) and specifying the feature value of [D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR](ne-d3d12video-d3d12_feature_video.md).
 * 
 * Set the desired block size for video motion estimation with the [D3D12_VIDEO_MOTION_ESTIMATOR_DESC](ns-d3d12video-d3d12_video_motion_estimator_desc.md) passed into [ID3D12VideoDevice1::CreateVideoMotionEstimator](nf-d3d12video-id3d12videodevice1-createvideomotionestimator.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_motion_estimator_search_block_size
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE extends Win32Enum{

    /**
     * The search block size is 8x8 pixels.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_8X8 => 0

    /**
     * The search block size is 16x16 pixels.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_16X16 => 1
}
