#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_RESOURCE_COORDINATE.ahk

/**
 * Receives output data from calls to ID3D12VideoEncodeCommandList::ResolveMotionVectorHeap.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_resolve_video_motion_vector_heap_output
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_OUTPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the output resource for resolved motion vectors. Motion vectors are resolved to [DXGI_FORMAT_R16G16_SINT](../dxgiformat/ne-dxgiformat-dxgi_format.md) 2D textures. The resolved data is a signed 16-byte integer with quarter PEL units with the X vector component stored in the R component and the Y vector component stored in the G component. Motion vectors are stored in a 2D layout that corresponds to the pixel layout of the original input textures.
     * @type {Pointer<ID3D12Resource>}
     */
    pMotionVectorTexture2D {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A [D3D12_RESOURCE_COORDINATE](ns-d3d12video-d3d12_resource_coordinate.md) structure specifying the output origin of the motion vectors. The remaining sub-region must be large enough to store all motion vectors per block specified by the input pixel with and pixel height and the specified [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE](ne-d3d12video-d3d12_video_motion_estimator_search_block_size.md).
     * @type {D3D12_RESOURCE_COORDINATE}
     */
    MotionVectorCoordinate{
        get {
            if(!this.HasProp("__MotionVectorCoordinate"))
                this.__MotionVectorCoordinate := D3D12_RESOURCE_COORDINATE(this.ptr + 8)
            return this.__MotionVectorCoordinate
        }
    }
}
