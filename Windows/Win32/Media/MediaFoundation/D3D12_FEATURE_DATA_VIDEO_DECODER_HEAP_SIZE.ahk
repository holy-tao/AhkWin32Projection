#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_DECODER_HEAP_DESC.ahk

/**
 * Describes the allocation size of a video decoder heap.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_decoder_heap_size
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A [D3D12_VIDEO_DECODER_HEAP_DESC](ns-d3d12video-d3d12_video_decoder_heap_desc.md) describing a [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md).
     * @type {D3D12_VIDEO_DECODER_HEAP_DESC}
     */
    VideoDecoderHeapDesc{
        get {
            if(!this.HasProp("__VideoDecoderHeapDesc"))
                this.__VideoDecoderHeapDesc := D3D12_VIDEO_DECODER_HEAP_DESC(this.ptr + 0)
            return this.__VideoDecoderHeapDesc
        }
    }

    /**
     * The allocation size of the video decoder heap in the L0 memory pool. L0 is the physical system memory pool. When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU. When the adapter is UMA, this pool is the only one which is valid. For more information, see [Residency](/windows/win32/direct3d12/residency).
     * @type {Integer}
     */
    MemoryPoolL0Size {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The allocation size of the video decoder heap in the L1 memory pool. L1 is typically known as the physical video memory pool. L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU. When the adapter is UMA, this pool is not available. For more information, see [Residency](/windows/win32/direct3d12/residency).
     * @type {Integer}
     */
    MemoryPoolL1Size {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
