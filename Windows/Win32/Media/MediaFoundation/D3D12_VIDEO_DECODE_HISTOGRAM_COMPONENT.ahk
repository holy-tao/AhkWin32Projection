#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies indices for arrays of per component histogram information. (D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT)
 * @remarks
 * The [D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS](ne-d3d12video-d3d12_video_decode_histogram_component_flags.md) is the flags enumeration used by [D3D12_FEATURE_DATA_VIDEO_DECODE_HISTOGRAM](ns-d3d12video-d3d12_feature_data_video_decode_histogram.md) to allow you to specify one or more components for which histogram data is queried.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_histogram_component
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT{

    /**
     * If the format is a YUV format, indicates a histogram for the Y component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_Y => 0

    /**
     * If the format is a YUV format, indicates a histogram for the U component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_U => 1

    /**
     * If the format is a YUV format, indicates a histogram for the V component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_V => 2

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the R component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_R => 0

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the G component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_G => 1

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the B component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_B => 2

    /**
     * If the format has an alpha channel, indicates a histogram for the A component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_A => 3
}
