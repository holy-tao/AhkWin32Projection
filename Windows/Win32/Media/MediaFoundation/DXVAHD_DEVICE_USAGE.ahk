#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the intended use for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * The graphics driver uses one of these enumeration constants as a hint when it creates the DXVA-HD device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_device_usage
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_DEVICE_USAGE{

    /**
     * Normal video playback. The graphics driver should expose a set of capabilities that are appropriate for real-time video playback.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_USAGE_PLAYBACK_NORMAL => 0

    /**
     * Optimal speed.  The graphics driver should expose a minimal set of capabilities that are optimized for performance.
 * 
 * Use this setting if you want better performance and can accept some reduction in video quality. For example, you might use this setting in power-saving mode or to play video thumbnails.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_USAGE_OPTIMAL_SPEED => 1

    /**
     * Optimal quality. The graphics driver should expose its maximum set of capabilities.
 * 
 * Specify this setting to get the best video quality possible. It is appropriate for tasks such as video editing, when quality is more important than speed. It is not appropriate for real-time playback.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_USAGE_OPTIMAL_QUALITY => 2
}
