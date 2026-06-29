#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Encapsulates the compressed bitstream output for the encoding operation.
 * @remarks
 * The output bitstream is expected to contain the subregion headers, but not the picture, sequence, video or other headers. The host is responsible for coding those headers and generating the complete bitstream.
 * 
 * In subregion frame partitioning, all subregions for a given frame encoding operation output must be placed in top/down, left/right order and must be contiguous.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_compressed_bitstream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM {
    #StructPack 8

    /**
     * A pointer to a [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource) containing the compressed bitstream buffer. Note that the resource buffer size is not the available size for this encoding operation because *FrameStartOffset* needs to be taken into account against this size.
     */
    pBuffer : ID3D12Resource

    /**
     * A UINT64 specifying th offset into the compressed bitstream where the encoder may start adding the current frame output.
     */
    FrameStartOffset : Int64

}
