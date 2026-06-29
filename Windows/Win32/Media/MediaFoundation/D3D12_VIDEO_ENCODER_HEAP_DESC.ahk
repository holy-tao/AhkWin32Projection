#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk" { D3D12_VIDEO_ENCODER_LEVEL_SETTING }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS }
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk" { D3D12_VIDEO_ENCODER_LEVELS_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_FLAGS.ahk" { D3D12_VIDEO_ENCODER_HEAP_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }

/**
 * Describes a ID3D12VideoEncoderHeap.
 * @remarks
 * If support for resolution dynamic reconfiguration is not supported, specify only one resolution in *pResolutionList*, denoting the desired target resolution.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_heap_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_HEAP_DESC {
    #StructPack 8

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A bitwise or combination of values from the [D3D12_VIDEO_ENCODER_HEAP_FLAGS](ne-d3d12video-d3d12_video_encoder_heap_flags.md) enumeration specifying encoder heap creation options.
     */
    Flags : D3D12_VIDEO_ENCODER_HEAP_FLAGS

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the codec of the associated encoder object.
     */
    EncodeCodec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the profile for the selected codec in the associated encoder object.
     */
    EncodeProfile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) specifying the level for the selected codec in the associated encoder object.
     */
    EncodeLevel : D3D12_VIDEO_ENCODER_LEVEL_SETTING

    /**
     * The count of resolutions requested to be supported present in the *pResolutionList* field.
     */
    ResolutionsListCount : UInt32

    /**
     * Pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) specifying the list of resolutions requested to be supported.
     */
    pResolutionList : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.Ptr

}
