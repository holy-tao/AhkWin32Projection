#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk

/**
 * Retrieves the list of supported resolutions for the specified codec.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which the supported resolutions are being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The number of resolution ratios to retrieve. This number must match the number in the [D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT.ResolutionRatiosCount](ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution_ratios_count.md) field returned from a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with **D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT** specified as the feature.
     * @type {Integer}
     */
    ResolutionRatiosCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Receives a boolean indicating if the query inputs are supported.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Receives the minimum resolution supported for the specified codec.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    MinResolutionSupported{
        get {
            if(!this.HasProp("__MinResolutionSupported"))
                this.__MinResolutionSupported := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 16)
            return this.__MinResolutionSupported
        }
    }

    /**
     * Receives the maximum resolution supported for the specified codec.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    MaxResolutionSupported{
        get {
            if(!this.HasProp("__MaxResolutionSupported"))
                this.__MaxResolutionSupported := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 24)
            return this.__MaxResolutionSupported
        }
    }

    /**
     * A UINT specifying a number by which the resolution width component must be divisible.
     * @type {Integer}
     */
    ResolutionWidthMultipleRequirement {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A UINT specifying a number by which the resolution height component must be divisible.
     * @type {Integer}
     */
    ResolutionHeightMultipleRequirement {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Receives a list of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) representing the supported resolution ratios for the specified codec as irreducible fractions. The caller must allocate the memory for this array based on the **ResolutionRatiosCount** field, and assign it to the query struct the call to ID3D12VideoDevice::CheckFeatureSupport.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC>}
     */
    pResolutionRatios {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
