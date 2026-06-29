#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE.ahk" { D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }
#Import ".\D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION.ahk" { D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the allocation size of a video motion estimator heap.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_motion_estimator_size
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_SIZE {
    #StructPack 8

    /**
     * In multi-adapter operation, identifies the physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the input and reference resources.
     */
    InputFormat : DXGI_FORMAT

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE](ne-d3d12video-d3d12_video_motion_estimator_search_block_size.md) specifying the search block size for motion estimation.
     */
    BlockSize : D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION](ne-d3d12video-d3d12_video_motion_estimator_vector_precision.md) specifying the search block size for motion estimation.
     */
    Precision : D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the minimum and maximum input and reference frame size, in pixels, used by the motion estimator.
     */
    SizeRange : D3D12_VIDEO_SIZE_RANGE

    /**
     * TRUE if the motion estimator operates on protected resource input and produces protected output; otherwise, FALSE.
     */
    Protected : BOOL

    /**
     * The allocation size of the motion vector heap in the L0 memory pool. L0 is the physical system memory pool. When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU. When the adapter is UMA, this pool is the only one which is valid. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MotionVectorHeapMemoryPoolL0Size : Int64

    /**
     * The allocation size of the motion vector heap in the L1 memory pool. L1 is typically known as the physical video memory pool. L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU. When the adapter is UMA, this pool is not available. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MotionVectorHeapMemoryPoolL1Size : Int64

    /**
     * The allocation size of the motion estimator heap in the L0 memory pool. L0 is the physical system memory pool. When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU. When the adapter is UMA, this pool is the only one which is valid. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MotionEstimatorMemoryPoolL0Size : Int64

    /**
     * The allocation size of the motion estimator heap in the L1 memory pool. L1 is typically known as the physical video memory pool. L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU. When the adapter is UMA, this pool is not available. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MotionEstimatorMemoryPoolL1Size : Int64

}
