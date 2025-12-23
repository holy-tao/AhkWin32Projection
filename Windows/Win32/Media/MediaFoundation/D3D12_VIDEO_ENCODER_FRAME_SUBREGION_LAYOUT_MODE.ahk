#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies video encoder frame subregion layout modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE extends Win32Enum{

    /**
     * Full frame output support.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_FULL_FRAME => 0

    /**
     * Frame subregions are set as a number of bytes per subregion.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_BYTES_PER_SUBREGION => 1

    /**
     * Frame subregions are set as a number of squared blocks per subregion. The number of squared blocks does not need to be multiple of a row size in squared blocks (e.g. if the subregions don't need to be row-aligned). To set row-aligned number of squared blocks per subregion, use the D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_ROWS_PER_SUBREGION or D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_SUBREGIONS_PER_FRAME mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_SQUARE_UNITS_PER_SUBREGION_ROW_UNALIGNED => 2

    /**
     * Frames are divided into a number of slices determined by the number of rows per slice. The size in pixels of the rows can be calculated using the current resolution and [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.SubregionBlockPixelsSize](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) for the current frame resolution.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_ROWS_PER_SUBREGION => 3

    /**
     * Frames are divided into the specified number of slices.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_SUBREGIONS_PER_FRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_GRID_PARTITION => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_CONFIGURABLE_GRID_PARTITION => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_AUTO => 7
}
