#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values for the source stream category.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_stream_category
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_STREAM_CATEGORY extends Win32Enum {

    /**
     * Specifies a video preview stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_PREVIEW
     * @type {Integer (Int32)}
     */
    static VIDEO_PREVIEW => 0

    /**
     * Specifies a video capture stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_CAPTURE
     * @type {Integer (Int32)}
     */
    static VIDEO_CAPTURE => 1

    /**
     * Specifies an independent photo stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_INDEPENDENT
     * @type {Integer (Int32)}
     */
    static PHOTO_INDEPENDENT => 2

    /**
     * Specifies a dependent photo stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_DEPENDENT
     * @type {Integer (Int32)}
     */
    static PHOTO_DEPENDENT => 3

    /**
     * Specifies an audio stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 4

    /**
     * Specifies an unsupported stream.
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_UNSUPPORTED
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED => 5

    /**
     * Native name: MF_CAPTURE_ENGINE_STREAM_CATEGORY_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 6
}
