#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates possible media player errors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayererror
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerError extends Win32Enum{

    /**
     * The error is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The last operation was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 1

    /**
     * A network error occurred.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * A media decoding error occurred.
     * @type {Integer (Int32)}
     */
    static DecodingError => 3

    /**
     * The media type is not supported.
     * @type {Integer (Int32)}
     */
    static SourceNotSupported => 4
}
