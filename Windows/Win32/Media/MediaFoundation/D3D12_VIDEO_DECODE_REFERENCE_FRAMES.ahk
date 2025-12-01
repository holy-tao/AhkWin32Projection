#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the list of reference frames for the current decode operation.
 * @remarks
 * Reference textures may have limitations such as a requirement to allocate reference buffers as a texture array.  For information on the requirements for different decoder configurations, see [D3D12_VIDEO_DECODE_TIER](ne-d3d12video-d3d12_video_decode_tier.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_reference_frames
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_REFERENCE_FRAMES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of references specified in the *ppTexture2Ds* field.
     * @type {Integer}
     */
    NumTexture2Ds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A list of reference textures. When specifying texture arrays, each entry will be point to the same resource. When specifying an array of textures, each entry will point to a separate resource.
     * @type {Pointer<ID3D12Resource>}
     */
    ppTexture2Ds {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of subresource indices for the reference textures specified in *ppTexture2Ds*.  NULL indicates that subresource 0 should be assumed for each resource.
     * 
     * With texture arrays within a single resource, the subresource indices point to the array index of the first resource plane. With an array of textures in individual resources, the subresource index is typically zero.
     * 
     * The video device driver uses the "PicEntry" indices defined in the DXVA spec for the codec to dereference this array to find the subresource index to use with the corresponding resource. For example, in HEVC, the Driver uses [DXVA_PicEntry_HEVC::Index7Bits](/windows/win32/medfound/dxva-picentry-hevc) as an index for this array.
     * @type {Pointer<Integer>}
     */
    pSubresources {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An array of [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md) objects. This field is used with formats that support non-key frame resolution changes, allowing the caller to pass in the previous resolution's heap, relative to the reference it's being used for, in addition to the current resolution heap.
     * @type {Pointer<ID3D12VideoDecoderHeap>}
     */
    ppHeaps {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
