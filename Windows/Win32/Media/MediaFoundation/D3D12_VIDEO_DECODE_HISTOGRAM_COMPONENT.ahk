#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies indices for arrays of per component histogram information. (D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT)
 * @remarks
 * The [D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS](ne-d3d12video-d3d12_video_decode_histogram_component_flags.md) is the flags enumeration used by [D3D12_FEATURE_DATA_VIDEO_DECODE_HISTOGRAM](ns-d3d12video-d3d12_feature_data_video_decode_histogram.md) to allow you to specify one or more components for which histogram data is queried.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_histogram_component
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT extends Win32Enum {

    /**
     * If the format is a YUV format, indicates a histogram for the Y component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_Y
     * @type {Integer (Int32)}
     */
    static Y => 0

    /**
     * If the format is a YUV format, indicates a histogram for the U component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_U
     * @type {Integer (Int32)}
     */
    static U => 1

    /**
     * If the format is a YUV format, indicates a histogram for the V component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_V
     * @type {Integer (Int32)}
     */
    static V => 2

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the R component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_R
     * @type {Integer (Int32)}
     */
    static R => 0

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the G component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_G
     * @type {Integer (Int32)}
     */
    static G => 1

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the B component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_B
     * @type {Integer (Int32)}
     */
    static B => 2

    /**
     * If the format has an alpha channel, indicates a histogram for the A component.
     * Native name: D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_A
     * @type {Integer (Int32)}
     */
    static A => 3
}
