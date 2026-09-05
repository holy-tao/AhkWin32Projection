#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the kind of media stream that failed.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_streamtype_failed
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_STREAMTYPE_FAILED extends Win32Enum {

    /**
     * The stream type is unknown.
     * Native name: MF_MEDIA_ENGINE_STREAMTYPE_FAILED_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The stream is an audio stream.
     * Native name: MF_MEDIA_ENGINE_STREAMTYPE_FAILED_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 1

    /**
     * The stream is a video stream.
     * Native name: MF_MEDIA_ENGINE_STREAMTYPE_FAILED_VIDEO
     * @type {Integer (Int32)}
     */
    static VIDEO => 2
}
