#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags that indicate the most efficient methods for performing video processing operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_video_processor_behavior_hints
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINTS{

    /**
     * Multi-plane overlay hardware can perform the rotation operation more efficiently than the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> method.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_ROTATION => 1

    /**
     * Multi-plane overlay hardware can perform the scaling operation more efficiently than the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> method.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_RESIZE => 2

    /**
     * Multi-plane overlay hardware can perform the colorspace conversion operation more efficiently than the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> method.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_COLOR_SPACE_CONVERSION => 4

    /**
     * The video processor output data should be at least triple buffered for optimal performance.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_TRIPLE_BUFFER_OUTPUT => 8
}
