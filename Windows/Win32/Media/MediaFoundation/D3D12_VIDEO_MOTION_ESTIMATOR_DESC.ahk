#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE.ahk" { D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }
#Import ".\D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION.ahk" { D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes a ID3D12VideoMotionEstimator. Pass this structure into ID3D12VideoDevice1::CreateVideoMotionEstimator to create an instance of ID3D12VideoMotionEstimator.
 * @remarks
 * Call [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) and specify [D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR](ne-d3d12video-d3d12_feature_video.md) as the feature to determine supported values.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_motion_estimator_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_MOTION_ESTIMATOR_DESC {
    #StructPack 4

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A value from the [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) enumeration specifying the format of the input and reference frames.
     */
    InputFormat : DXGI_FORMAT

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE](ne-d3d12video-d3d12_video_motion_estimator_search_block_size.md) enumeration specifying the search block size the video motion estimator will use.
     */
    BlockSize : D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION](ne-d3d12video-d3d12_video_motion_estimator_vector_precision.md) enumeration specifying the vector precision the video motion estimator will use.
     */
    Precision : D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the minimum and maximum input and reference frame size, in pixels, that the motion estimator will accept.
     */
    SizeRange : D3D12_VIDEO_SIZE_RANGE

}
