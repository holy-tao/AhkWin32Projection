#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a video format can be used for video processing.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_format_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FORMAT_SUPPORT{

    /**
     * The format can be used as the input to the video processor.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_SUPPORT_INPUT => 1

    /**
     * The format can be used as the output from the video processor.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_SUPPORT_OUTPUT => 2
}
