#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the kind of media stream that failed.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_streamtype_failed
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_STREAMTYPE_FAILED{

    /**
     * The stream type is unknown.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STREAMTYPE_FAILED_UNKNOWN => 0

    /**
     * The stream is an audio stream.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STREAMTYPE_FAILED_AUDIO => 1

    /**
     * The stream is a video stream.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_STREAMTYPE_FAILED_VIDEO => 2
}
