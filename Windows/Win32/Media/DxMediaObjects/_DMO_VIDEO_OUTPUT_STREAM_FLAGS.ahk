#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DMO_VIDEO_OUTPUT_STREAM_FLAGS enumeration defines flags that describe requested features, for video optimizations.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_VIDEO_OUTPUT_STREAM_FLAGS{

    /**
     * Requests that every output buffer passed to the DMO contain the previous data that was generated.
     * @type {Integer (Int32)}
     */
    static DMO_VOSF_NEEDS_PREVIOUS_SAMPLE => 1
}
