#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS.ahk" { D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS }

/**
 * Represents metadata about an ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @remarks
 * **D3D12_VIDEO_ENCODER_OUTPUT_METADATA** and its child structures are all aligned to a 64-bit access boundary for use with [SetPredication](../d3d12/nf-d3d12-id3d12graphicscommandlist-setpredication.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_output_metadata
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_OUTPUT_METADATA {
    #StructPack 8

    /**
     * A **UINT64** representing a bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG](ne-d3d12video-d3d12_video_encoder_encode_error_flags.md) enumeration specifying information about the encode execution status.
     */
    EncodeErrorFlags : Int64

    /**
     * A [D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS](ns-d3d12video-d3d12_video_encoder_output_metadata_statistics.md) representing statistics for an **EncodeFrame** operation.
     */
    EncodeStats : D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS

    /**
     * Output field that receives a **UINT64** indicating how many bytes were into [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.pBuffer](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md) plus the value of  [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.FrameStartOffset](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md).
     */
    EncodedBitstreamWrittenBytesCount : Int64

    /**
     * Output field that receives a **UINT64** indicating the number of subregions used to encode the current frame.
     * 
     * This value is coherent with the settings specified in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.pFrameSubregionsLayoutData](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md). If a number of subregions was specified, *WrittenSubregionsCount* should match that value. If another mode was used, this field is how the driver reports the final number of subregions. If the output is a full frame, then there is only 1 subregion.
     */
    WrittenSubregionsCount : Int64

}
