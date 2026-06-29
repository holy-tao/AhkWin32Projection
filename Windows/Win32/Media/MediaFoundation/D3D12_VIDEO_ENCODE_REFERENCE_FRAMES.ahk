#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents the reconstructed reference images for an encoding operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encode_reference_frames
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODE_REFERENCE_FRAMES {
    #StructPack 8

    /**
     * The number of textures in the *ppTexture2Ds* array.
     */
    NumTexture2Ds : UInt32

    /**
     * An array of [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) textures containing the reference images.
     */
    ppTexture2Ds : ID3D12Resource.Ptr

    /**
     * An array of subresource indices for the reference textures specified in *ppTexture2Ds*. NULL indicates that subresource 0 should be assumed for each resource.
     * With texture arrays within a single resource, the subresource indices point to the array index of the first resource plane. With an array of textures in individual resources, the subresource index is typically zero.
     */
    pSubresources : IntPtr

}
