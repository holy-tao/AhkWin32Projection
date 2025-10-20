#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides input data for calls to ID3D12VideoEncodeCommandList::ResolveMotionVectorHeap.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_resolve_video_motion_vector_heap_input
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The [ID3D12VideoMotionVectorHeap](nn-d3d12video-id3d12videomotionvectorheap.md) containing the hardware-dependent data layout of the motion search.
     * @type {ID3D12VideoMotionVectorHeap}
     */
    pMotionVectorHeap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The pixel width of the texture that the motion estimation operation was performed on. The motion estimator heap may be allocated to support a size range, this parameter informs the size of the last motion estimation operation.
     * @type {Integer}
     */
    PixelWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The pixel height of the texture that the motion estimation operation was performed on. The motion estimator heap may be allocated to support a size range, this parameter informs the size of the last motion estimation operation.
     * @type {Integer}
     */
    PixelHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
