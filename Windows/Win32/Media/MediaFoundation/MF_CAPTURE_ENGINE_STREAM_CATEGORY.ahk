#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the values for the source stream category.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_stream_category
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_STREAM_CATEGORY{

    /**
     * Specifies a video preview stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_PREVIEW => 0

    /**
     * Specifies a video capture stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_CAPTURE => 1

    /**
     * Specifies an independent photo stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_INDEPENDENT => 2

    /**
     * Specifies a dependent photo stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_DEPENDENT => 3

    /**
     * Specifies an audio stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_AUDIO => 4

    /**
     * Specifies an unsupported stream.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_UNSUPPORTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_STREAM_CATEGORY_METADATA => 6
}
