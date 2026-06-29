#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC }
#Import ".\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC }

/**
 * Describes the allocation size of a video decoder heap. (D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_processor_size
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE {
    #StructPack 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A pointer to a D3D12\_VIDEO\_PROCESS\_OUTPUT\_STREAM\_DESC(ns-d3d12video-d3d12_video_process_output_stream_desc) structure describing the output stream.
     */
    pOutputStreamDesc : D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.Ptr

    /**
     * The number of input streams provided in the *pInputStreamDescs* parameter.
     */
    NumInputStreamDescs : UInt32

    /**
     * A pointer to a list of D3D12\_VIDEO\_PROCESS\_INPUT\_STREAM\_DESC(ns-d3d12video-d3d12_video_process_input_stream_desc) structures the input streams.
     */
    pInputStreamDescs : D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.Ptr

    /**
     * The allocation size of the video processor in the L0 memory pool. L0 is the physical system memory pool. When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU. When the adapter is UMA, this pool is the only one which is valid. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MemoryPoolL0Size : Int64

    /**
     * The allocation size of the video processor in the L1 memory pool. L1 is typically known as the physical video memory pool. L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU. When the adapter is UMA, this pool is not available. For more information, see [Residency](/windows/win32/direct3d12/residency).
     */
    MemoryPoolL1Size : Int64

}
