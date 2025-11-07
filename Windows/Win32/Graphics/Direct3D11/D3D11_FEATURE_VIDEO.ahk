#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a Direct3D 11 video feature or feature set to query about.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/ne-d3d11_4-d3d11_feature_video
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_VIDEO{

    /**
     * Retrieves the supported components, bin count, and counter bit depth for the a decode histogram with the specified decode profile, resolution, and format. The associated data structure is <a href ="ns-d3d11_4-d3d11_feature_data_video_decoder_histogram.md">D3D11_FEATURE_DATA_VIDEO_DECODER_HISTOGRAM</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_VIDEO_DECODER_HISTOGRAM => 0
}
