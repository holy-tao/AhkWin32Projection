#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the input parameters for calls to ID3D12VideoEncodeCommandList::EstimateMotion.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_motion_estimator_input
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_ESTIMATOR_INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the current frame. The motion estimation operation applies to the entire frame.
     * @type {ID3D12Resource}
     */
    pInputTexture2D {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The base plane of the MIP and array slice to use for the input.
     * @type {Integer}
     */
    InputSubresourceIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the reference frame, or past frame, used for motion estimation.
     * @type {ID3D12Resource}
     */
    pReferenceTexture2D {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The base plane of the MIP and array slice to use for the reference.
     * @type {Integer}
     */
    ReferenceSubresourceIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An [ID3D12VideoMotionVectorHeap](nn-d3d12video-id3d12videomotionvectorheap.md) representing the buffer containing the hardware-dependent output of the previous motion estimator operation which may be used for hinting the current operation. This parameter may be NULL, indicating that previous motion estimator output should not be considered for the current operation.
     * @type {ID3D12VideoMotionVectorHeap}
     */
    pHintMotionVectorHeap {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
