#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }

/**
 * The D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT structure (d3d12video.h) retrieves the number of supported resolution ratios for the specified codec.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution_ratios_count
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT {
    #StructPack 4

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which the number of supported resolution ratios is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * Receives a UINT indicating the number of supported resolution ratios for the specified codec.
     */
    ResolutionRatiosCount : UInt32

}
