#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }

/**
 * Retrieves the list of supported resolutions for the specified codec.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION {
    #StructPack 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which the supported resolutions are being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * The number of resolution ratios to retrieve. This number must match the number in the [D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT.ResolutionRatiosCount](ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution_ratios_count.md) field returned from a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with **D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT** specified as the feature.
     */
    ResolutionRatiosCount : UInt32

    /**
     * Receives a boolean indicating if the query inputs are supported.
     */
    IsSupported : BOOL

    /**
     * Receives the minimum resolution supported for the specified codec.
     */
    MinResolutionSupported : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC

    /**
     * Receives the maximum resolution supported for the specified codec.
     */
    MaxResolutionSupported : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC

    /**
     * A UINT specifying a number by which the resolution width component must be divisible.
     */
    ResolutionWidthMultipleRequirement : UInt32

    /**
     * A UINT specifying a number by which the resolution height component must be divisible.
     */
    ResolutionHeightMultipleRequirement : UInt32

    /**
     * Receives a list of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) representing the supported resolution ratios for the specified codec as irreducible fractions. The caller must allocate the memory for this array based on the **ResolutionRatiosCount** field, and assign it to the query struct the call to ID3D12VideoDevice::CheckFeatureSupport.
     */
    pResolutionRatios : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC.Ptr

}
