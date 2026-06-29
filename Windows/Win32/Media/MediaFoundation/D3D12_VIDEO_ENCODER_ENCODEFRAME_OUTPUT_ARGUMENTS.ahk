#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.ahk" { D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM }
#Import ".\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk" { D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER }
#Import ".\D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE.ahk" { D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents output arguments to ID3D12VideoEncodeCommandList2::EncodeFrame.
 * @remarks
 * The caller must check for alignment requirements for the output resources used for the encoding operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_encodeframe_output_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS {
    #StructPack 8

    /**
     * A [A D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md) containing the result of the encoding operation.
     */
    Bitstream : D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM

    /**
     * A [D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE](ns-d3d12video-d3d12_video_encoder_reconstructed_picture.md)  representing a reconstructed picture generated from the input frame. This resource is only needed if the encoded picture is marked to be used as a reference picture in the corresponding picture control structure for this encode operation, NULL can be set otherwise as the reconstructed picture will not be written in the output.
     */
    ReconstructedPicture : D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE

    /**
     * A [D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER](ns-d3d12video-d3d12_video_encoder_encode_operation_metadata_buffer.md) representing encoding metadata returned by the encoder in hardware-specific layout. This data must be resolved into a readable format using [ID3D12VIDEOCOMMANDLIST2::ResolveEncoderOutputMetadata](nf-d3d12video-id3d12videoencodecommandlist2-resolveencoderoutputmetadata.md).
     */
    EncoderOutputMetadata : D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER

}
