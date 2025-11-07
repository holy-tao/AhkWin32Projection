#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the alpha fill mode for video processing.
 * @remarks
 * 
 * **D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_OPAQUE** must be always supported.  The background, destination, and source stream modes are only supported when the driver reports [D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_FILL](ne-d3d12video-d3d12_video_process_feature_flags.md).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_process_alpha_fill_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE{

    /**
     * Alpha values inside the target rectangle are set to opaque.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_OPAQUE => 0

    /**
     * Alpha values inside the target rectangle are set to the alpha value specified in the background color.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_BACKGROUND => 1

    /**
     * Existing alpha values remain unchanged in the output surface.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_DESTINATION => 2

    /**
     * Alpha values are taken from an input stream, scaled, and copied to the corresponding destination rectangle for that stream. The input stream is specified in the *AlphaFillModeSourceStreamIndex* member of <a href="ns-d3d12video-d3d12_video_process_input_stream_arguments.md">D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS</a>.
     * 
     * If the input stream does not have alpha data, the video processor sets the alpha values in the target rectangle to opaque. If the input stream is disabled or the source rectangle is empty, the alpha values in the target rectangle are not modified.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_SOURCE_STREAM => 3
}
