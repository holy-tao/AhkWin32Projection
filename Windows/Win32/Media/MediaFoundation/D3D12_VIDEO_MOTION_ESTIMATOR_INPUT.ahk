#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12VideoMotionVectorHeap.ahk" { ID3D12VideoMotionVectorHeap }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Specifies the input parameters for calls to ID3D12VideoEncodeCommandList::EstimateMotion.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_motion_estimator_input
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_MOTION_ESTIMATOR_INPUT {
    #StructPack 8

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the current frame. The motion estimation operation applies to the entire frame.
     */
    pInputTexture2D : ID3D12Resource

    /**
     * The base plane of the MIP and array slice to use for the input.
     */
    InputSubresourceIndex : UInt32

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the reference frame, or past frame, used for motion estimation.
     */
    pReferenceTexture2D : ID3D12Resource

    /**
     * The base plane of the MIP and array slice to use for the reference.
     */
    ReferenceSubresourceIndex : UInt32

    /**
     * An [ID3D12VideoMotionVectorHeap](nn-d3d12video-id3d12videomotionvectorheap.md) representing the buffer containing the hardware-dependent output of the previous motion estimator operation which may be used for hinting the current operation. This parameter may be NULL, indicating that previous motion estimator output should not be considered for the current operation.
     */
    pHintMotionVectorHeap : ID3D12VideoMotionVectorHeap

}
