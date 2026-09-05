#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the intended use for a video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_usage
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_USAGE extends Win32Enum {

    /**
     * Normal video playback. The graphics driver should expose a set of capabilities that are appropriate for real-time video playback.
     * Native name: D3D11_VIDEO_USAGE_PLAYBACK_NORMAL
     * @type {Integer (Int32)}
     */
    static PLAYBACK_NORMAL => 0

    /**
     * Optimal speed. The graphics driver should expose a minimal set of capabilities that are optimized for performance.
     * 
     * 
     * 
     * Use this setting if you want better performance and can accept some reduction in video quality. For example, you might use this setting in power-saving mode or to play video thumbnails.
     * Native name: D3D11_VIDEO_USAGE_OPTIMAL_SPEED
     * @type {Integer (Int32)}
     */
    static OPTIMAL_SPEED => 1

    /**
     * Optimal quality. The graphics driver should expose its maximum set of capabilities.
     * 
     * Specify this setting to get the best video quality possible. It is appropriate for tasks such as video editing, when quality is more important than speed. It is not appropriate for real-time playback.
     * Native name: D3D11_VIDEO_USAGE_OPTIMAL_QUALITY
     * @type {Integer (Int32)}
     */
    static OPTIMAL_QUALITY => 2
}
