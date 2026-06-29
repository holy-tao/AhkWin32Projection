#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents a compressed bitstream from which video is decoded.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_compressed_bitstream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM {
    #StructPack 8

    /**
     * A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the source buffer containing the compressed bitstream to decode.
     */
    pBuffer : ID3D12Resource

    /**
     * The offset to the beginning of the first slice.  This offset has alignment requirements based on the tier value of the video decoder. For more information on decoding tiers, see [D3D12_VIDEO_DECODE_TIER](ne-d3d12video-d3d12_video_decode_tier.md).
     */
    Offset : Int64

    /**
     * The size of the subregion of *pBuffer* that contains the bitstream.
     */
    Size : Int64

}
