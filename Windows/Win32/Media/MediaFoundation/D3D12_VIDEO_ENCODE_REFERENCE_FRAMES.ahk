#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the reconstructed reference images for an encoding operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encode_reference_frames
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODE_REFERENCE_FRAMES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of textures in the *ppTexture2Ds* array.
     * @type {Integer}
     */
    NumTexture2Ds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md) textures containing the reference images.
     * @type {Pointer<ID3D12Resource>}
     */
    ppTexture2Ds {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of subresource indices for the reference textures specified in *ppTexture2Ds*. NULL indicates that subresource 0 should be assumed for each resource.
     * With texture arrays within a single resource, the subresource indices point to the array index of the first resource plane. With an array of textures in individual resources, the subresource index is typically zero.
     * @type {Pointer<UInt32>}
     */
    pSubresources {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
