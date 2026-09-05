#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of timed text track.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_TRACK_KIND extends Win32Enum {

    /**
     * The kind of timed text track is unknown.
     * Native name: MF_TIMED_TEXT_TRACK_KIND_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The kind of timed text track is subtitles.
     * Native name: MF_TIMED_TEXT_TRACK_KIND_SUBTITLES
     * @type {Integer (Int32)}
     */
    static SUBTITLES => 1

    /**
     * The kind of timed text track is closed captions.
     * Native name: MF_TIMED_TEXT_TRACK_KIND_CAPTIONS
     * @type {Integer (Int32)}
     */
    static CAPTIONS => 2

    /**
     * The kind of timed text track is metadata.
     * Native name: MF_TIMED_TEXT_TRACK_KIND_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 3
}
