#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies statistics that the Media Engine tracks during playback.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_statistic
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_STATISTIC{

    /**
     * The number of rendered video frames. (<b>ULONG</b>, <b>VT_UI4</b>)
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_FRAMES_RENDERED => 0

    /**
     * The number of dropped video frames. (<b>ULONG</b>, <b>VT_UI4</b>)
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_FRAMES_DROPPED => 1

    /**
     * The number of bytes that have been downloaded since the last HTTP range request. (<b>ULARGE_INTEGER</b>, <b>VT_UI8</b>).
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_BYTES_DOWNLOADED => 2

    /**
     * The percentage of the playout buffer filled during buffering. The value is an integer in the range 0–100. (<b>LONG</b>, <b>VT_I4</b>)
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_BUFFER_PROGRESS => 3

    /**
     * The frames per second. (<b>FLOAT</b>, <b>VT_R4</b>)
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_FRAMES_PER_SECOND => 4

    /**
     * The amount of playback jitter. (<b>DOUBLE</b>, <b>VT_R8</b>)
 * 
 * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_PLAYBACK_JITTER => 5

    /**
     * The number of corrupted frames. (<b>ULONG</b>, <b>VT_UI4</b>)
 * 
 * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_FRAMES_CORRUPTED => 6

    /**
     * The total amount of frame delay.  (<b>DOUBLE</b>, <b>VT_R8</b>)
 * 
 * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STATISTIC_TOTAL_FRAME_DELAY => 7
}
