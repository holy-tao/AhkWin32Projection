#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the kind of timed text track.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_TRACK_KIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The kind of timed text track is unknown.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_KIND_UNKNOWN => 0

    /**
     * The kind of timed text track is subtitles.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_KIND_SUBTITLES => 1

    /**
     * The kind of timed text track is closed captions.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_KIND_CAPTIONS => 2

    /**
     * The kind of timed text track is metadata.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_TRACK_KIND_METADATA => 3
}
