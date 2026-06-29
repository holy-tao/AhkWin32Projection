#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents the reconstructed picture generated from the input frame passed to the encode operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reconstructed_picture
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE {
    #StructPack 8

    /**
     * A [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource) representing the reconstructed picture generated from the input frame.
     */
    pReconstructedPicture : ID3D12Resource

    /**
     * A UINT64 specifying the subresource index for *pReconstructedPicture*.
     */
    ReconstructedPictureSubresource : UInt32

}
