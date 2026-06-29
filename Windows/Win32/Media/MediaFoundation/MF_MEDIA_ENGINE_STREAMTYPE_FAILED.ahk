#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the kind of media stream that failed.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_streamtype_failed
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_STREAMTYPE_FAILED {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
