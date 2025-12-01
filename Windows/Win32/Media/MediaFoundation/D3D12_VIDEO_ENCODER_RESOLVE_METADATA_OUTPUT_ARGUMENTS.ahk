#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * Represents output arguments for a call to ID3D12VideoEncodeCommandList2::ResolveEncoderOutputMetadata.
 * @remarks
 * The following diagram illustrates the resolved metadata memory layout in an ID3D12Resource.
 * 
 * :::image type="content" source="images/d3d12-video-resolved-metadata-layout.png" alt-text="Diagram of the resolved metadata memory layout in an ID3D12Resource":::
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_resolve_metadata_output_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A [D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER](ns-d3d12video-d3d12_video_encoder_encode_operation_metadata_buffer.md) representing the resolved metadata buffer.
     * 
     * This buffer must be read back to the CPU by the caller and cast to a [D3D12_VIDEO_ENCODER_OUTPUT_METADATA](ns-d3d12video-d3d12_video_encoder_output_metadata.md) structure. The remaining data in the buffer, corresponds to **D3D12_VIDEO_ENCODER_OUTPUT_METADATA.WrittenSubregionsCount** packed entries of type [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_METADATA](ns-d3d12video-d3d12_video_encoder_frame_subregion_metadata.md).
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    ResolvedLayoutMetadata{
        get {
            if(!this.HasProp("__ResolvedLayoutMetadata"))
                this.__ResolvedLayoutMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(0, this)
            return this.__ResolvedLayoutMetadata
        }
    }
}
