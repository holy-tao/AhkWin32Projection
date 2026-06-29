#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents a buffer containing metadata about an ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_encode_operation_metadata_buffer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER {
    #StructPack 8

    /**
     * A pointer to an [ID3D12Resource](..//d3d12/nn-d3d12-id3d12resource.md) representing the metadata buffer.
     */
    pBuffer : ID3D12Resource

    /**
     * The offset into the associated buffer.
     */
    Offset : Int64

}
