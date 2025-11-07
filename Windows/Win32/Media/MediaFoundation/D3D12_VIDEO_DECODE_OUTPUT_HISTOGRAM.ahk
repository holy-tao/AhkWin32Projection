#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the histogram output buffer for a single component.
 * @remarks
 * 
 * Histogram output buffers are provided in the *Histograms* field of the [D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1](ns-d3d12video-d3d12_video_decode_output_stream_arguments1.md) structure.
 * 
 * 
 * The following [D3D12_HEAP_FLAGS](../d3d12/ne-d3d12-d3d12_heap_flags.md) are allowed when allocating heaps for video decode histograms.
 * 
 * - D3D12_HEAP_FLAG_SHARED
 * - D3D12_HEAP_FLAG_ALLOW_DISPLAY
 * - D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER
 * - D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES
 * - D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES
 * - D3D12_HEAP_FLAG_HARDWARE_PROTECTED
 * - D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH
 * 
 * The following [D3D12_HEAP_FLAGS](../d3d12/ne-d3d12-d3d12_heap_flags.md) are not allowed when allocating heaps for video decode histograms.
 * 
 * - D3D12_HEAP_FLAG_DENY_BUFFERS
 *  
 * The following [D3D12_RESOURCE_FLAGS](../d3d12/ne-d3d12-d3d12_resource_flags.md) are allowed when allocating resources for video decode histograms.
 * 
 * - D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET
 * - D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS
 * - D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER
 * - D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS
 * - D3D12_RESOURCE_FLAG_ALLOW_TEXTURE_DATA_INHERITANCE
 * 
 * The following [D3D12_RESOURCE_FLAGS](../d3d12/ne-d3d12-d3d12_resource_flags.md) are not allowed when allocating resources for video decode histograms.
 * 
 * - D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL
 * - D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE
 * - D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY
 * - D3D12_RESOURCE_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURE_PLACEMENT
 * - D3D12_RESOURCE_FLAG_ALLOW_ONLY_RT_DS_TEXTURE_PLACEMENT
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_decode_output_histogram
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_OUTPUT_HISTOGRAM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset location in *pBuffer* to write the component histogram.  Must be 256-byte aligned.  Set to zero when a component is disabled.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * And [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) representing the target buffer for hardware to write the components histogram.  Set to a nullptr when the component histogram is disabled.
     * @type {ID3D12Resource}
     */
    pBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
