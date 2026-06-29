#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import ".\D3D12_VIDEO_DECODER_HEAP_DESC.ahk" { D3D12_VIDEO_DECODER_HEAP_DESC }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes the allocation size of a video decoder heap. (D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_decoder_heap_size
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE {
    #StructPack 8

    /**
     * A [D3D12_VIDEO_DECODER_HEAP_DESC](ns-d3d12video-d3d12_video_decoder_heap_desc.md) describing a [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md).
     */
    VideoDecoderHeapDesc : D3D12_VIDEO_DECODER_HEAP_DESC

    /**
     * The allocation size of the video decoder heap in the L0 memory pool. L0 is the physical system memory pool. When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU. When the adapter is UMA, this pool is the only one which is valid. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MemoryPoolL0Size : Int64

    /**
     * The allocation size of the video decoder heap in the L1 memory pool. L1 is typically known as the physical video memory pool. L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU. When the adapter is UMA, this pool is not available. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MemoryPoolL1Size : Int64

}
