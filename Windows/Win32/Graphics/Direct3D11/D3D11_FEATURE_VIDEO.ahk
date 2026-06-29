#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a Direct3D 11 video feature or feature set to query about.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/ne-d3d11_4-d3d11_feature_video
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_VIDEO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Retrieves the supported components, bin count, and counter bit depth for the a decode histogram with the specified decode profile, resolution, and format. The associated data structure is <a href ="ns-d3d11_4-d3d11_feature_data_video_decoder_histogram.md">D3D11_FEATURE_DATA_VIDEO_DECODER_HISTOGRAM</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_VIDEO_DECODER_HISTOGRAM => 0
}
