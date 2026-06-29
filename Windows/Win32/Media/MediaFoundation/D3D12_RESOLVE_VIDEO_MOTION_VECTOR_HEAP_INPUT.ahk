#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12VideoMotionVectorHeap.ahk" { ID3D12VideoMotionVectorHeap }

/**
 * Provides input data for calls to ID3D12VideoEncodeCommandList::ResolveMotionVectorHeap.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_resolve_video_motion_vector_heap_input
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_INPUT {
    #StructPack 8

    /**
     * The [ID3D12VideoMotionVectorHeap](nn-d3d12video-id3d12videomotionvectorheap.md) containing the hardware-dependent data layout of the motion search.
     */
    pMotionVectorHeap : ID3D12VideoMotionVectorHeap

    /**
     * The pixel width of the texture that the motion estimation operation was performed on. The motion estimator heap may be allocated to support a size range, this parameter informs the size of the last motion estimation operation.
     */
    PixelWidth : UInt32

    /**
     * The pixel height of the texture that the motion estimation operation was performed on. The motion estimator heap may be allocated to support a size range, this parameter informs the size of the last motion estimation operation.
     */
    PixelHeight : UInt32

}
