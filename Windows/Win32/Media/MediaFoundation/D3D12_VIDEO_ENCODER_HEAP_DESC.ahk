#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * Describes a ID3D12VideoEncoderHeap.
 * @remarks
 * If support for resolution dynamic reconfiguration is not supported, specify only one resolution in *pResolutionList*, denoting the desired target resolution.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_heap_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_HEAP_DESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitwise or combination of values from the [D3D12_VIDEO_ENCODER_HEAP_FLAGS](ne-d3d12video-d3d12_video_encoder_heap_flags.md) enumeration specifying encoder heap creation options.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the codec of the associated encoder object.
     * @type {Integer}
     */
    EncodeCodec {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the profile for the selected codec in the associated encoder object.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    EncodeProfile{
        get {
            if(!this.HasProp("__EncodeProfile"))
                this.__EncodeProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 16)
            return this.__EncodeProfile
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) specifying the level for the selected codec in the associated encoder object.
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    EncodeLevel{
        get {
            if(!this.HasProp("__EncodeLevel"))
                this.__EncodeLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 32)
            return this.__EncodeLevel
        }
    }

    /**
     * The count of resolutions requested to be supported present in the *pResolutionList* field.
     * @type {Integer}
     */
    ResolutionsListCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) specifying the list of resolutions requested to be supported.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>}
     */
    pResolutionList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
