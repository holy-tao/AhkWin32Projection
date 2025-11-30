#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_FULL_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_BYTES_PER_SUBREGION => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_SQUARE_UNITS_PER_SUBREGION_ROW_UNALIGNED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_ROWS_PER_SUBREGION => 3

    /**
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
