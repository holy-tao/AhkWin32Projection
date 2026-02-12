#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the playback state of a [MediaPlaybackSession](mediaplaybacksession.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackstate
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackState extends Win32Enum{

    /**
     * No current state.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A media item is opening.
     * @type {Integer (Int32)}
     */
    static Opening => 1

    /**
     * A media item is buffering.
     * @type {Integer (Int32)}
     */
    static Buffering => 2

    /**
     * A media item is playing.
     * @type {Integer (Int32)}
     */
    static Playing => 3

    /**
     * Playback of a media item is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 4
}
