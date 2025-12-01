#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the video encoder resolution support limits for a D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The maximum number of subregions per frame supported by the encoder for the associated resolution.  For the mode [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_BYTES_PER_SUBREGION](ns-d3d12video-d3d12_feature_data_video_encoder_frame_subregion_layout_mode.md) this value must be the absolute maximum limit of subregions per frame to be coded.
     * @type {Integer}
     */
    MaxSubregionsNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number that can be used in [D3D12_VIDEO_ENCODER_INTRA_REFRESH.IntraRefreshDuration](ns-d3d12video-d3d12_video_encoder_intra_refresh.md) for the associated resolution.
     * @type {Integer}
     */
    MaxIntraRefreshFrameDuration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size in pixels of the squared regions that will be used to partition the frame for the subregion layout (e.g. slices) semantics for the associated resolution. The resolution of the frame will be rounded up to be aligned to this value when it's partitioned in blocks. The configuration of the subregion partitioning will use a number of squared subregions, that have their size in pixels according to the returned value in this argument.
     * 
     * > [!NOTE]
     * > For HEVC, this indicates the resolution block alignment for the compressed bitstream. For example: If SubregionBlockPixelsSize = 32, then SPS.pic_width/height_in_luma_samples must be aligned to this value and SPS.conf_win_*_offset/conformance_window_flag indicate the difference between this aligned resolution and the current frame resolution indicated by [D3D12_RESOURCE_DESC.Dimension](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension) of the input video texture. *SubregionBlockPixelsSize* must be aligned to [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC.MinLumaCodingUnitSize](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264.md) (minCUSize), so SPS.pic_width/height_in_luma_samples ends up aligned to minCUSize as required by the HEVC codec spec.
     * @type {Integer}
     */
    SubregionBlockPixelsSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size in pixels of the squared regions for the associated resolution that will be affected by each of the values in the QP map buffer in absolute or delta QP modes. The resolution of the frame will be rounded up to be aligned to this value when it's partitioned in blocks for QP maps and the number of QP values in those maps will be the number of blocks of these indicated pixel size that comprise a full frame.
     * @type {Integer}
     */
    QPMapRegionPixelsSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
