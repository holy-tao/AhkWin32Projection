#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS.ahk

/**
 * Represents metadata about an ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @remarks
 * **D3D12_VIDEO_ENCODER_OUTPUT_METADATA** and its child structures are all aligned to a 64-bit access boundary for use with [SetPredication](../d3d12/nf-d3d12-id3d12graphicscommandlist-setpredication.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_output_metadata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_OUTPUT_METADATA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A **UINT64** representing a bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG](ne-d3d12video-d3d12_video_encoder_encode_error_flags.md) enumeration specifying information about the encode execution status.
     * @type {Integer}
     */
    EncodeErrorFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS](ns-d3d12video-d3d12_video_encoder_output_metadata_statistics.md) representing statistics for an **EncodeFrame** operation.
     * @type {D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS}
     */
    EncodeStats{
        get {
            if(!this.HasProp("__EncodeStats"))
                this.__EncodeStats := D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS(this.ptr + 8)
            return this.__EncodeStats
        }
    }

    /**
     * Output field that receives a **UINT64** indicating how many bytes were into [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.pBuffer](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md) plus the value of  [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.FrameStartOffset](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md).
     * @type {Integer}
     */
    EncodedBitstreamWrittenBytesCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Output field that receives a **UINT64** indicating the number of subregions used to encode the current frame.
     * 
     * This value is coherent with the settings specified in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.pFrameSubregionsLayoutData](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md). If a number of subregions was specified, *WrittenSubregionsCount* should match that value. If another mode was used, this field is how the driver reports the final number of subregions. If the output is a full frame, then there is only 1 subregion.
     * @type {Integer}
     */
    WrittenSubregionsCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
