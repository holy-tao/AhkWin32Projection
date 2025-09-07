#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the kind of timed text track.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_TRACK_KIND{

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
