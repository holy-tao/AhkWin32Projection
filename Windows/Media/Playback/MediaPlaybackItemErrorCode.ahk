#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of error that occurred while opening a [MediaPlaybackItem](mediaplaybackitem.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemerrorcode
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItemErrorCode extends Win32Enum{

    /**
     * No error code.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Opening of the playback item was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 1

    /**
     * A network error occurred while opening the playback item.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * An error occurred while decoding the playback item.
     * @type {Integer (Int32)}
     */
    static DecodeError => 3

    /**
     * The media source of the playback item is not supported.
     * @type {Integer (Int32)}
     */
    static SourceNotSupportedError => 4

    /**
     * An error occurred related to the playback item's encryption.
     * @type {Integer (Int32)}
     */
    static EncryptionError => 5
}
