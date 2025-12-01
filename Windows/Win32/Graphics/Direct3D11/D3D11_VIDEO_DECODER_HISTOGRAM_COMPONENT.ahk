#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies indices for arrays of per component histogram information. (D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT)
 * @remarks
 * The [D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS](ne-d3d11_4-d3d11_video_decoder_histogram_component_flags.md) is the flags enumeration used by [D3D11_FEATURE_DATA_VIDEO_DECODER_HISTOGRAM](ns-d3d11_4-d3d11_feature_data_video_decoder_histogram.md) to allow you to specify one or more components for which histogram data is queried.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/ne-d3d11_4-d3d11_video_decoder_histogram_component
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT extends Win32Enum{

    /**
     * If the format is a YUV format, indicates a histogram for the Y component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_Y => 0

    /**
     * If the format is a YUV format, indicates a histogram for the U component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_U => 1

    /**
     * If the format is a YUV format, indicates a histogram for the V component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_V => 2

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the R component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_R => 0

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the G component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_G => 1

    /**
     * If the format is an RGB/BGR format, indicates a histogram for the B component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_B => 2

    /**
     * If the format has an alpha channel, indicates a histogram for the A component.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_A => 3
}
