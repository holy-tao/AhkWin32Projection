#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the alpha fill mode for video processing.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_alpha_fill_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE{

    /**
     * Alpha values inside the target rectangle are set to opaque.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_OPAQUE => 0

    /**
     * Alpha values inside the target rectangle are set to the alpha value specified in the background color. To set the background color, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputbackgroundcolor">ID3D11VideoContext::VideoProcessorSetOutputBackgroundColor</a> method.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_BACKGROUND => 1

    /**
     * Existing alpha values remain unchanged in the output surface.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_DESTINATION => 2

    /**
     * Alpha values are taken from an  input stream, scaled, and copied to the corresponding destination rectangle for that stream. The input stream is specified in the <i>StreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputalphafillmode">ID3D11VideoContext::VideoProcessorSetOutputAlphaFillMode</a> method. 
 * 
 * If the input stream does not have alpha data, the video processor sets the alpha values in the target rectangle to opaque. If the input stream is disabled or the source rectangle is empty, the alpha values in the target rectangle are not modified.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_SOURCE_STREAM => 3
}
